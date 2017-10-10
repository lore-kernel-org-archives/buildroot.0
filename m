From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 10:12:23 +0200
Subject: [Buildroot] [PATCH v2] nmap: add option to build/install "ncat"
In-Reply-To: <1eb061ff-7182-4ee3-15ab-8f2068db4696@mind.be>
References: <20171004124920.7358-1-casantos@datacom.ind.br>
 <20171004154313.25762-1-casantos@datacom.ind.br>
 <f45e607f-ebff-129a-0064-de7fa4255be6@mind.be>
 <1613988304.12988742.1507565613269.JavaMail.zimbra@datacom.ind.br>
 <1eb061ff-7182-4ee3-15ab-8f2068db4696@mind.be>
Message-ID: <20171010101223.67b1ab6e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Oct 2017 00:08:38 +0200, Arnout Vandecappelle wrote:

> 5. BR2_PACKAGE_NMAP builds nothing, two new options BR2_PACKAGE_NMAP_NMAP and
> BR2_PACKAGE_NMAP_NCAT build nmap resp. ncat. To avoid building nothing, you
> could try something like
> 
> config BR2_PACKAGE_NMAP
> 	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NMAP_NMAP
> 
> if BR2_PACKAGE_NMAP
> config BR2_PACKAGE_NMAP_NMAP
> 	default y
> 
> config BR2_PACKAGE_NMAP_NCAT
> endif
> 
> but that might give a circular dependency.

This option has my preference. And it doesn't have a circular
dependency, we use this construct in several places already.

One example:

config BR2_PACKAGE_ANDROID_TOOLS
        bool "android-tools"
        select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
              !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
              !BR2_PACKAGE_ANDROID_TOOLS_ADB

if BR2_PACKAGE_ANDROID_TOOLS

config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
        bool "fastboot"

config BR2_PACKAGE_ANDROID_TOOLS_ADB
        bool "adb"

config BR2_PACKAGE_ANDROID_TOOLS_ADBD
        bool "adbd"

endif

However, perhaps we should invert the select:

	select BR2_PACKAGE_NMAP_NMAP if !BR2_PACKAGE_NMAP_NCAT

and drop the "default y" in BR2_PACKAGE_NMAP_NMAP. This way, we still
have "nmap" enabled by default, and now allow the option to select ncat.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
