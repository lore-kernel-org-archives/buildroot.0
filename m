From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Aug 2015 00:21:01 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <20150808232242.GC3594@free.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
 <20150710095419.1ec6da31@free-electrons.com>
 <55C4B65A.3010804@green-communications.fr>
 <20150808104308.2438494b@free-electrons.com> <20150808232242.GC3594@free.fr>
Message-ID: <55D8F5CD.2070203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/2015 01:22 AM, Yann E. MORIN wrote:
> Now, the mariadb vs. mysql case might not be so problematic. We don't
> much expect a myriad of alternate implementations to just pop-up over
> the night, 

 Well, actually... IIUC there are in fact two MariaDB implementations: the
cluster verion (Galera, added here) and the single-node version. Well, they
might actually be the same, but the download URLs are different.

 Sylvain, can you comment?


 That said, I don't see a big problem adding a third option to the choice
whenever the other mariadb is added.



> and even less hardware-specific implementations. But who
> knows? That's probably what we originally thought about the jpeg case,
> and now I see at least one reason why we should not have done it that
> way... Maybe some vendors have specially-crafted mysql /forks/ tailored
> to specific use-cases (but do we care?)...

 MariaDB already is a fork :-)


 BTW, regarding jpeg support in BR2_EXTERNAL, it could be supported but it gets
a bit complicated:

===== jpeg/Config.in =====
config BR2_PACKAGE_JPEG
	bool "jpeg support"

if BR2_PACKAGE_JPEG

choice
	prompt "jpeg variant"

config BR2_PACKAGE_LIBJPEG
	bool "jpeg"
	depends on !BR2_PACKAGE_EXTERNAL_JPEG_SELECTED
	select BR2_PACKAGE_HAS_JPEG

config BR2_PACKAGE_JPEG_TURBO
	bool "jpeg-turbo"
	depends on !BR2_PACKAGE_EXTERNAL_JPEG_SELECTED
	select BR2_PACKAGE_HAS_JPEG

# The following one will only be visible if we select an external JPEG library
# The other choices will vanish then.
config BR2_PACKAGE_EXTERNAL_JPEG
	bool "provided in BR2_EXTERNAL"
	depends on BR2_PACKAGE_EXTERNAL_JPEG_SELECTED
	select BR2_PACKAGE_HAS_JPEG

endchoice

config BR2_PACKAGE_HAS_JPEG
	bool

# This extra symbol is needed to be able to hide the internal ones
config BR2_PACKAGE_EXTERNAL_JPEG_SELECTED
	bool
	select BR2_PACKAGE_EXTERNAL_JPEG

config BR2_PACKAGE_PROVIDES_JPEG
	string
	default "libjpeg"    if BR2_PACKAGE_LIBJPEG
	default "jpeg-turbo" if BR2_PACKAGE_JPEG_TURBO

endif


==== BR2_EXTERNAL/try-this/Config.in ====
# This one actually looks like a normal virtual package
config BR2_PACKAGE_TRY_THIS
	bool "try this!"
	select BR2_PACKAGE_EXTERNAL_JPEG_SELECTED

config BR2_PACKAGE_PROVIDES_JPEG
	default "trythis" if BR2_PACKAGE_TRY_THIS

====


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
