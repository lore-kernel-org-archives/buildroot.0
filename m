From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Thu, 5 May 2016 23:29:20 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <20160505142533.67f8e473@free-electrons.com>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be> <572AEB2E.1050305@gmail.com>
 <572AFC1F.3070004@gmail.com> <20160505142533.67f8e473@free-electrons.com>
Message-ID: <572BBB30.9090901@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 05/05/2016 14:25, Thomas Petazzoni ha scritto:
> I think it does, see https://patchwork.ozlabs.org/patch/612073/. Thomas 

I apologize, I haven't yet much knowledge about applying patches.
This is what I did:

$git pull
$git apply --stat 
v2-2-2-qt5connectivity-add-bluez5_utils-option-for-QtBluetooth-submodule.patch
$git apply --check 
v2-2-2-qt5connectivity-add-bluez5_utils-option-for-QtBluetooth-submodule.patch

but I got:

error: patch non riuscita: package/qt5/qt5connectivity/Config.in:4
error: package/qt5/qt5connectivity/Config.in: la patch non pu? essere 
applicata
error: patch non riuscita: package/qt5/qt5connectivity/qt5connectivity.mk:20
error: package/qt5/qt5connectivity/qt5connectivity.mk: la patch non pu? 
essere applicata

Thus I opened the file package/qt5/qt5connectivity/Config.in and in fact 
I see a content very different from the "old version" reported in the patch.

My file:

config BR2_PACKAGE_QT5CONNECTIVITY
     bool "qt5connectivity"
     select BR2_PACKAGE_BLUEZ_UTILS
     select BR2_PACKAGE_QT5BASE
     select BR2_PACKAGE_QT5BASE_CONCURRENT
     select BR2_PACKAGE_QT5BASE_DBUS
     depends on !BR2_STATIC_LIBS # bluez_utils
     depends on BR2_USE_WCHAR # bluez_utils
     depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
     depends on BR2_USE_MMU # bluez_utils

what the patch expects:

select BR2_PACKAGE_QT5BASE_CONCURRENT
  	select BR2_PACKAGE_QT5BASE_DBUS
  	depends on !BR2_STATIC_LIBS
- depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS
+ depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || 
BR2_PACKAGE_BLUEZ5_UTILS

It seems I have an outdated file, but it's not enough git pull to sync 
with the latest version?
By the way I'm running this one: Buildroot 2016.05-git-01197-gda433d6-dirty

Is there a way to understand on which version the patch was created against?

Thanks for the support
Marco
