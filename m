From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 19 Apr 2013 19:00:21 -0400
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <5171AF1B.4010806@mind.be>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
Message-ID: <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 19, 2013 at 4:54 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 19/04/13 13:41, Mathias De Mar? wrote:
>
>>
>> wouldn't an alternative possibility be to change the CCACHE_COMPILERCHECK
>> to:
>> export CCACHE_COMPILERCHECK=%**compiler% -v
>>
>> You don't rely on the timestamp that way, but you still have a check. I
>> believe this resolves the clearing of ccache also (see also
>> http://lists.busybox.net/**pipermail/buildroot/2012-**March/051187.html<http://lists.busybox.net/pipermail/buildroot/2012-March/051187.html>).
>>
>
>  That sounds like a very good idea!
>
>  It still has a few shortcomings, but it's definitely better than the
> current situation. At least the following are not solved yet.
>
> - Options included in the external toolchain wrapper are not included. For
> instance, if you switch to Thumb on the Sourcery ARM toolchain, that will
> be recorded in the additional cflags in the wrapper and won't be visible to
> ccache.
>
> - The output of gcc -v contains the absolute path, so if you change the
> output directory (or share the ccache between several developers) it won't
> work. But it would be feasible to strip off the $(O) part.
>
> - For internal/crosstool-NG toolchains, when toolchain parameters are
> changed this is still not detected. For instance, some configure script
> checks for wchar, it fails, you change your configuration to include WCHAR
> and rebuild, and it still fails because the cached test is used...
>


I think that the "%**compiler% -v" suggestion is definitely more robust
that the current "none" setting, and my CCACHE_HASHDIR idea.  Glad I asked!

Regarding the settings hidden by the ext-toolchan wrapper and the built
toolchain configuration options - what if we took a hash of the
ext-toolchain wrapper or built compiler itself, and the -v info, and used
that directly in the ccache check.  We could do a one-time hash when the
toolchain is set up:

    $(TARGET_CC_NOCCACHE) -v > $(STAMP_DIR)/toolchain-config-info
    md5sum -b $(TARGET_CC_NOCCACHE) >> $(STAMP_DIR)/toolchain-config-info
    md5sum $(STAMP_DIR)/toolchain-config-info >
$(STAMP_DIR)/toolchain-config-info.md5sum

and then set the CCACHE_COMPILERCHECK to "echo
$(STAMP_DIR)/toolchain-config-info.md5sum".  Then, the effects of all the
hidden variables are in some way accounted for without grepping for them in
the .config.

Is that crazy talk?

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130419/0da6ec47/attachment.html>
