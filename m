From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:04:38 +0100
Subject: [Buildroot] [RFC v4 0/4] mariadb: new package
In-Reply-To: <20161216222654.23747-1-bluemrp9@gmail.com>
References: <20161216222654.23747-1-bluemrp9@gmail.com>
Message-ID: <20161217150438.0172072e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Dec 2016 14:26:50 -0800, Ryan Coe wrote:
> This patch series represents my attempt to add MariaDB 10.1 to Buildroot.
> Based on feedback, this series does three things.  First, the old mysql package
> is renamed to oracle-mysql.  Second, mariadb is added as a new package.  Third,
> mysql is converted to a virtual package.  I have tested this on arm and x86_64
> with uclibc and glibc.

Thanks a lot, I've applied your patch series. However, before doing so,
I did a few changes. Indeed, with your patch series, after PATCH 1, but
before PATCH 4, all packages in Buildroot that did depend or select
BR2_PACKAGE_MYSQL would have been broken.

To keep things bisectable, here is what I have done:

 - Move the patch introducing mariadb as the first patch. I adjusted
   the "depends on !BR2_PACKAGE_ORACLE_MYSQL" to "depends
   on !BR2_PACKAGE_MYSQL".

 - Merge the patches renaming mysql to oracle-mysql and moving it to a
   virtual package (also offering mariadb).

I did some quick built tests, and it also went fine. Let's monitor the
autobuilders in the next days to see if anything breaks.

However, it is good to remind you that since mariadb is only selected
through a choice and is not the default, it will never be chosen by the
autobuilders (due to a Kconfig issue, choices are not randomized in our
autobuilder testing).

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
