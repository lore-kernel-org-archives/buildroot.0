From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 14 Jan 2011 13:47:54 +0100
Subject: [Buildroot] freetype: fix for multilib toolchain
In-Reply-To: <20110114091129.13d810c8@surf>
References: <BAY145-w16379D55CDD8378B320C74C2F30@phx.gbl>
	<20110114091129.13d810c8@surf>
Message-ID: <AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 14 January 2011 09:11, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Matt,
>
> On Thu, 13 Jan 2011 21:18:33 -0700
> Matt Johnson <mj1856@hotmail.com> wrote:
>
>> FreeType's makefile needs to have the architecture (example, -march=armv4t) passed in the LDFLAGS in order to work properly with a multilib toolchain, like CodeSourcery. ?This is the easiest way I could think of to do it. ?Tested and works.
>
> The description of your patch should be wrapped at ~80 columns.
>
>> Signed-off-by: Matt Johnson <mj1856@hotmail.com>
>> ---
>> ?package/freetype/freetype.mk | ? ?1 +
>> ?1 files changed, 1 insertions(+), 0 deletions(-)
>> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
>> index ad4292f..7e59b57 100644
>> --- a/package/freetype/freetype.mk
>> +++ b/package/freetype/freetype.mk
>> @@ -8,6 +8,7 @@ FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
>> ?FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
>> ?FREETYPE_INSTALL_STAGING = YES
>> ?FREETYPE_INSTALL_TARGET = YES
>> +FREETYPE_CONF_ENV = LDFLAGS="-march=$(CC_TARGET_ARCH_) $(TARGET_LDFLAGS)"
>
> I am not sure I want to see this fixed this way. It looks like the
> issue reported by Divick Kishore on sshd is similar: we need to pass
> the -march argument in the LDFLAGS for all packages.
>
> So probably we should rather adjust TARGET_LDFLAGS globally (its
> definition is in package/Makefile.in) so that it contains the
> appropriate -march.

AFAIK, ld does not have an "-march" option (just looked at the man page).
So I'd say that it is the freetype (and sshd?) package that needs to be fixed
(and not BR) because they are using LDFLAGS wrong.

Best regards,
Bj?rn Forsman
