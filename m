From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Jan 2014 17:56:37 +0200
Subject: [Buildroot] Configuring the gpsd package
In-Reply-To: <858B5C1843112849BC285F6BF91A22640EB2B042@VF2WDEXMB1.verifone.com>
References: <858B5C1843112849BC285F6BF91A22640EB1B569@VF2WDEXMB1.verifone.com>
 <20140101162040.GJ4470@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BADB@VF2WDEXMB1.verifone.com>
 <20140102080145.GL6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BB09@VF2WDEXMB1.verifone.com>
 <20140102084544.GN6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBA1@VF2WDEXMB1.verifone.com>
 <20140102100454.GS6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBD1@VF2WDEXMB1.verifone.com>
 <858B5C1843112849BC285F6BF91A22640EB2B042@VF2WDEXMB1.verifone.com>
Message-ID: <20140106155637.GA4503@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gabi,

On Mon, Jan 06, 2014 at 03:42:31PM +0000, Gabi Kelemen wrote:
> After doing some more diggings, I found that the reason I don't see the gpsd 
> option in menuconfig, is due to the 2 dependencies BR2_USE_MMU, 
> BR2_TOOLCHAIN_HAS_THREADS which I probably don't have.
> Correct me if I'm wrong, but this is the same reason that the changes I make 
> to the config.in are not affecting the gpsd_config.h file?
> 
> Anyway, I was able to run the gpsd and use the it in spite of probably not 
> having the two dependencies. My questions are:
> 1. What is the purpose of the two dependencies?

As the comment above the MMU dependency says, the gpsd code uses fork(). This 
system call is not available on non-MMU systems. The same goes for threads 
support. The package uses the pthreads API, and doesn't build without it.

> 2. How come I was able to use the daemon anyway?

Apparently you are using an external toolchain. When using an external 
toolchain you need to explicitly tell Buildroot whether you toolchain includes 
threading supports.

As to MMU, for some reason this is option is disabled on your configuration, 
although clearly your target has MMU enabled.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
