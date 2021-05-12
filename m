From: Ryota Kinukawa <pojiro.jp@gmail.com>
Date: Thu, 13 May 2021 08:27:05 +0900
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do not
 apply patches with renames"
Message-ID: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi. Thank you for your great work, Buildroot team.
I'm writing this email for suggestions to support/scripts/apply-patches.sh.

Recently, I was working with buildroot to apply patches-4.14.164-rt73.
It included a patch((patches-4.14.164-rt73/0462-..)) which renames a file.
This caused the build to terminate with an error.

The reason for this is that apply-patches.sh exits when it finds a patch
that contains a rename.
This feature is kind for users who use legacy `patch` commands,
but not kind for current users.

So I'd like to suggest adding a kind of this line
  `grep -q "^BR2_*_LEGACY_PATCH_CMD=y" "$BR2_CONFIG" && \`
to below if statement.

```
if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
   ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
```

Parsing the results of the `patch` is dependent on the implementation of it,
so I think it would be better to get them who use `legacy patch` to set it
explicitly.
(For considering backward compatibility,
(it might be better if the environment variable had the opposite meaning.

How about this idea?

In making this suggestion I have read the following two threads.
- http://lists.busybox.net/pipermail/buildroot/2017-May/191794.html
- http://lists.busybox.net/pipermail/buildroot/2017-June/195335.html

Thank you.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210513/2cfdb0db/attachment.html>
