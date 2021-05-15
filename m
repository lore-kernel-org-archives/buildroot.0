From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 May 2021 08:44:04 +0200
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 (Ryota Kinukawa's message of "Thu, 13 May 2021 08:27:05 +0900")
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
Message-ID: <87fsyopkcr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryota" == Ryota Kinukawa <pojiro.jp@gmail.com> writes:

Hi,

 > Hi. Thank you for your great work, Buildroot team.
 > I'm writing this email for suggestions to support/scripts/apply-patches.sh.

 > Recently, I was working with buildroot to apply patches-4.14.164-rt73.
 > It included a patch((patches-4.14.164-rt73/0462-..)) which renames a file.
 > This caused the build to terminate with an error.

 > The reason for this is that apply-patches.sh exits when it finds a patch
 > that contains a rename.
 > This feature is kind for users who use legacy `patch` commands,
 > but not kind for current users.

 > So I'd like to suggest adding a kind of this line
 >   `grep -q "^BR2_*_LEGACY_PATCH_CMD=y" "$BR2_CONFIG" && \`
 > to below if statement.

 > ```
 > if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
 >    ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
 > ```

 > Parsing the results of the `patch` is dependent on the implementation of it,
 > so I think it would be better to get them who use `legacy patch` to set it
 > explicitly.
 > (For considering backward compatibility,
 > (it might be better if the environment variable had the opposite meaning.

 > How about this idea?

The problem with such an option is that it describes a property of the
build host, not of the Buildroot configuration - And we still wouldn't
be able to use rename patches as long as that option was supported.

So we want apply-patches.sh to work the same for everyone.

But we're now 4 years later, so perhaps it is time to unconditionally
drop support for GNU patch < 2.7?

GNU patch 2.7 was released in September 2012, so 8.5 years ago:

https://savannah.gnu.org/forum/forum.php?forum_id=7361

Thomas, Yann - Any ideas how common such old patch version are nowadays?

-- 
Bye, Peter Korsgaard
