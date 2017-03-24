From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Mar 2017 22:22:06 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-22
In-Reply-To: <d1327c7c-2434-1635-357a-627bb9f08a71@cartelsol.com>
References: <20170323072835.30CE220F42@mail.free-electrons.com>
 <d1327c7c-2434-1635-357a-627bb9f08a71@cartelsol.com>
Message-ID: <b00b8cf9-1269-a896-fbd8-b7f6d742fbc8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-03-17 02:02, Marcus Hoffmann wrote:
> Hello,
> 
> On 03/23/2017 08:28 AM, Thomas Petazzoni wrote:
>>          arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/616eacf5cd5a570ea2b8bba60dc42b109eaf8ed9 | ORPH
> 
> I looked at this one. When checking for SQLBindCol in -lodbc it fails
> because ltdl is apparently not linked.
> 
> This happens when we have BR2_STATIC_LIBS=y *and* we build with libtool.
> Enabling libtool switches off the internal libtld of unixodbc.

 Hm, probably unixodbc should select litltdl unconditionally because we don't
want to use bundled stuff. Although for ltdl one could argue that using the
bundled one is OK (it's more or less intended to be used bundled, much like
libtool itself).


> So with the internal version of libtld the build works. But this is a
> helper library for loading dynamic libraries, so umm, can this ever work?

 Hm, good point, is the target ltdl even useful in the STATIC context? The funny
thing about ltdl is that it builds even if there is no dlopen (or other dynamic
library loading function) available. But I'm not sure if applications deal
gracefully with the situation when lt_dlopen() fails...


 Regards,
 Arnout

> The build failure ss reproduceable with the following defconfig:
> 
> BR2_STATIC_LIBS=y
> BR2_PACKAGE_LIBTOOL=y
> BR2_PACKAGE_PHP=y
> BR2_PACKAGE_PHP_EXT_PDO=y
> BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC=y
> 
> Best wishes,
> Marcus
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
