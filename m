From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Nov 2013 09:25:52 +0100
Subject: [Buildroot] [PATCH 1 of 6 v2] legal info: fix saving of host
	package licenses
In-Reply-To: <5281D4C9.1070306@mind.be>
References: <patchbomb.1381151707@argentina>
 <e07dc5f55104adb4a171.1381151708@argentina>
 <5281D4C9.1070306@mind.be>
Message-ID: <CAAXf6LUPGZYwfR+KKofasY+Q6Fv56qHE+tzKZipfkn+CraKk9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

On Tue, Nov 12, 2013 at 8:12 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/10/13 15:15, Thomas De Schampheleire wrote:
>> Due to some tricky make behavior, the license texts of host packages that
>> did not provide an explicit HOST_FOO_LICENSE_FILES definition was not saved.
>> The problem is that you cannot correctly use a variable defined/updated
>> inside a call'ed block as input to a foreach statement. If you try to use
>> $(FOO) then only the original value of FOO is used for foreach, any update
>> inside the call'ed block is ignored. However, if you use $$(FOO), the entire
>> contents of FOO (typically a list of items) is passed as one item to
>> foreach, thus causing just one iteration instead of several.
>
>  The description of the problem is wrong... It has nothing to do with call,
> it is due to the eval behaviour.
>
>  Any variable referenced with a single $ inside the inner-generic-package macro
> is expanded before the resulting contents are eval'ed. Therefore, it is not
> possible to refer to variables defined by the inner-generic-package macro
> from within a single-$ function call.
>
>  Fortunately there is a simple solution: use $$. See below...

I object to the use of the word 'simple' here!

[..]

>  Try
>
>         @$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F))$$(sep))
>
>  Only the $(2) is expanded immediately, the rest will be expanded when
> the legal-info target is executed.

And indeed, it works.
I did try adding double dollar signs in some places, but more randomly
than with insight.

Thanks a lot, I'll send an updated patch!

Best regards,
Thomas
