From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 11:06:37 +0100
Subject: [Buildroot] [PATCH 1/2] udev: update udev to new virtual
 package infra.
In-Reply-To: <20140218100331.GA6731@pc-eric>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1392632536-16714-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140217114906.5b6aab4a@skate> <20140217143311.GA4920@pc-eric>
 <20140217153745.1e5683e9@skate> <20140218100331.GA6731@pc-eric>
Message-ID: <20140218110637.4d9ba6c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Tue, 18 Feb 2014 11:03:33 +0100, Eric Le Bihan wrote:

> I've made some further testing and unfortunately, the pure "make" solution
> does not work. The test on <foo>_DEPENDENCIES is performed when the Makefile
> is evaluated, whether <foo> virtual package is selected or not.
> 
> If virtual package <foo> is not selected, <foo>_DEPENDENCIES will be empty, so
> the test is true and the error message is displayed. That's not what we want.
> 
> Using <foo>_CONFIGURE_CMDS, the test will only be performed if the package is
> selected.

Then, just improve the test so that the test against the dependencies
is only made when the virtual package is selected:

ifeq ($(BR2_PACKAGE_<virtual package>),y)
ifeq ($(<virtual package>_DEPENDENCIES),)
$(error "Something wrong going on!")
endif
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
