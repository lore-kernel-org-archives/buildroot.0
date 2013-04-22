From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 22 Apr 2013 08:32:23 -0400
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <5174D1DE.6000902@mind.be>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
 <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
 <5171D63D.7050705@mind.be>
 <CANxTyt7EftWCmO25-reSsJJybTkzbB3srsrmZSwjKpadfQNt3w@mail.gmail.com>
 <5174D1DE.6000902@mind.be>
Message-ID: <CANxTyt7JzGaq0pirMDDUrEn_XTUxK-4CbaPP00Rn0O709eL50w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 22, 2013 at 1:59 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 20/04/13 18:08, Danomi Manchego wrote:
>
>> On Fri, Apr 19, 2013 at 7:41 PM, Arnout Vandecappelle <arnout@mind.be
>> <mailto:arnout@mind.be>> wrote:
>>
>>         Then, the effects of all the
>>         hidden variables are in some way accounted for without grepping
>>         for them
>>         in the .config.
>>
>>
>>       Not entirely. Many toolchain options affect the C library, not the
>>     compiler. A change in these options may not affect the gcc binary
>>     itself. Even a gcc configuration option may not change the gcc
>>     binary, because most of gcc is in cc1 and libgcc.a. But it's still an
>>     improvement over previous proposals.
>>
>>
>> Arnout, I'm wavering on this.
>>
>> At work, we only use external toolchains (downloaded or pre-installed),
>> so using the gcc -v output and the md5sum of the compiler/wrapper
>> provided to ccache is perfect for our projects, because
>> these discriminators capture everything.  But if toolchain configuration
>> options in the general case (for everyone else) cannot be simply captured
>> (without doing lots of variable renaming as you mentioned earlier),
>>
>
>  Actually, after thinking a bit harder about it: the following should work:
>
> sed -n '/^# Toolchain/,/^# System configuration/' $(BUILDROOT_CONFIG) \
>         | md5sum -
>
>  So there's no need to rename stuff or anything.


That would also use the GDB and ECLIPSE lines too.  But then, if it
accounts for everything outside of the "%compiler% -v" info (wrappers,
C-library), then it's worth it.

I suppose that we could drop the these lines with an inverse grep:

sed -n '/^# Toolchain/,/^# System configuration/p' .config | \
    grep -v -e '^#' -e GDG -e ECLIPSE | \
    md5sum

Too much?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130422/75eb3c53/attachment.html>
