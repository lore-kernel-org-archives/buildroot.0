From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 May 2014 11:56:02 +0200
Subject: [Buildroot] [PATCH 3/3] Support installation of Python in a
 different directory.
In-Reply-To: <1401341054-16705-4-git-send-email-vomlehn@canopus-us.com>
References: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
 <1401341054-16705-4-git-send-email-vomlehn@canopus-us.com>
Message-ID: <20140529115602.4cc33f00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 May 2014 22:24:14 -0700, vomlehn at canopus-us.com wrote:
> From: David VomLehn <vomlehn@canopus-us.com>
> 
> Python is both useful and large. This patch allows installation in a
> different directory, which can then be installed on its own device
> by packaging it as part of a separated filesystem.
> 
> Signed-off-by: David VomLehn <vomlehn@canopus-us.com>
> ---
>  package/python/Config.in |    7 +++++++
>  package/python/python.mk |   26 ++++++++++++++++----------
>  2 files changed, 23 insertions(+), 10 deletions(-)

The problem with this approach is that we would have to replicate this
in *all* packages. You are personally interested by changing the
installation location of Python. But I might be interested in changing
the installation location of Qt. And then the next guy the installation
location of X.org, and so on and so on.

That's a limitation of Kconfig: there is no way of creating
"properties" that would apply to all packages without creating one
option for each package. We have the same issue to define which package
should be built statically or dynamically, which package should be
built with debug symbols or not, and so on.

So I would prefer to see such advanced customization done by means of
the BR2_PACKAGE_OVERRIDE_FILE option. It would avoid cluttering the
Config.in files of packages with lots and lots of options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
