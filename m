From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:53:17 +0200
Subject: [Buildroot] [PATCH 2/2] qt5connectivity: add QtNfc submodule
In-Reply-To: <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
References: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
 <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20160413235317.604bbd46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Apr 2016 11:56:02 +0200, Julien Corjon wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5connectivity/Config.in          | 10 ++++++----
>  package/qt5/qt5connectivity/qt5connectivity.mk |  4 +++-
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
> index d529ea7..611ef14 100644
> --- a/package/qt5/qt5connectivity/Config.in
> +++ b/package/qt5/qt5connectivity/Config.in
> @@ -1,13 +1,15 @@
>  config BR2_PACKAGE_QT5CONNECTIVITY
>  	bool "qt5connectivity"
>  	select BR2_PACKAGE_BLUEZ_UTILS
> +	select BR2_PACKAGE_NEARD

So until now, neard was not necessary, and without any version bump or
anything, it should become a mandatory dependency? This seems weird,
and does not quite follow the policy of Buildroot that we should have
as much as possible the smallest set of mandatory dependencies.

Is it possible to have qt5connectivity with just Bluetooth support?
Just NFC support? No support for any of them at all?

I'm wondering if we shouldn't be doing:

ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
QT5CONNECTIVITY_DEPENDENCIES += bluez_utils
endif

ifeq ($(BR2_PACKAGE_NEARD),y)
QT5CONNECTIVITY_DEPENDENCIES += neard
endif

in the .mk file, instead of forcefully selecting both bluez_utils and
neard.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
