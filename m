From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 15:18:26 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <540DA81F.4080405@imgtec.com>
References: <20140907063013.1CB98101499@stock.ovh.net>
 <20140907100918.6b017a09@free-electrons.com>
 <540D69A4.4080503@imgtec.com>
 <20140908103445.6a8858b4@free-electrons.com>
 <540D6ADB.30300@imgtec.com>
 <20140908111733.1966e641@free-electrons.com>
 <540D9F28.1010709@imgtec.com>
 <20140908142902.4adfd667@free-electrons.com>
 <540DA81F.4080405@imgtec.com>
Message-ID: <20140908151826.1a9df0b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Sep 2014 13:59:11 +0100, Vicente Olivert Riera wrote:

> Those were my first days with Buildroot. Less than two weeks I guess.

No problem with that at all.

> Well, I think we should remove the dependence on 
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT in both grantlee and qt_script 
> packages. I made a confusion because qt_webkit was failing due to it's 
> JavaScriptCore part. That's not related to the Qt's script modue, so 
> qt_script (and the packages depending on qt_script) shouldn't depend on 
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT.
> 
> Does this make sense to you?

I think we need to understand whether the set of architectures
supported by QtScript is the same or not as the set of architectures
supported by QtWebkit, and if not, see if one set is a superset of the
other or not.

If QtScript and QtWebkit don't support the same set of architectures,
then we indeed need separate BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT and
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT options. And if there is an
interaction between the two sets, then maybe
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT can be defined as
BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT with some additional exceptions,
for example. Like (fictional code) :

config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
	default y if BR2_arm || BR2_powerpc || BR2_mips || ...

config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
	default y if BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && !BR2_mipsn32

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
