From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Mar 2016 10:43:57 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
	output file
In-Reply-To: <20160225203212.GD5870@free.fr>
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
 <20160225170758.1f444549@free-electrons.com>
 <CAAXf6LXz_WcAAsk+kts3cZ4=v1Pw1rB=nLf9yKr9FotCZRR8sg@mail.gmail.com>
 <874mcwwxyx.fsf@dell.be.48ers.dk> <20160225180158.673b34f5@free-electrons.com>
 <20160225203212.GD5870@free.fr>
Message-ID: <CAAXf6LVQsa+zGhG01Z4CPpzzfkqYPFhHsNDmvNp+t9af4aNApw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 25, 2016 at 9:32 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas?, All,
>
> On 2016-02-25 18:01 +0100, Thomas Petazzoni spake thusly:
>> Dear Peter Korsgaard,
>>
>> On Thu, 25 Feb 2016 17:34:14 +0100, Peter Korsgaard wrote:
>>
>> >  > Also, for packages where the source is included with buildroot, like
>> >  > makedevs, FOO_SITE is empty too.
>> >
>> > .. but those also don't define _SOURCE / _VERSION, so wget isn't called
>> > ;)
>>
>> Yeah, but I was proposing to check for an empty FOO_SITE in the package
>> infrastructure itself, so we're not at the point where wget gets called.
>
> What about:
>
>     diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>     index e22babb..64c6fdc 100644
>     --- a/package/pkg-generic.mk
>     +++ b/package/pkg-generic.mk
>     @@ -436,7 +436,7 @@ endif
>      $(2)_ALL_DOWNLOADS = \
>         $$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
>             $$(if $$(findstring ://,$$(p)),$$(p),\
>     -$$($(2)_SIT            E)/$$(p)))
>     +$$(if $$($(2)_SITE),$$($(2)_SITE)/$$(p))))
>
>      ifndef $(2         )_SITE
>       ifdef $(3)_SITE

I tried this, but it does not yield the desired end-result: no file
will be downloaded, the download step 'succeeds', and the extract step
fails because it can't find the expected file.

I found another clean and simple solution to my problem:

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -442,6 +442,8 @@ endif
 ifndef $(2)_SITE
  ifdef $(3)_SITE
   $(2)_SITE = $$($(3)_SITE)
+ else
+  $(2)_SITE = undefined
  endif
 endif

A similar 'undefined' trick is done to $(2)_VERSION.
Basically, either site is set, or it defaults to 'undefined'.
When a download is not attempted (e.g. source in buildroot, ...) there
is no change, if a download is attempted then it will fail due to
'undefined'.

What do you think?

Thanks,
Thomas
