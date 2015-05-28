From: Peter Bouda <pbouda@cidles.eu>
Date: Thu, 28 May 2015 08:47:24 +0100
Subject: [Buildroot] scons and check
In-Reply-To: <5565DCA4.5040002@green-communications.fr>
References: <5565DCA4.5040002@green-communications.fr>
Message-ID: <11559664.aMO1ZzHy8u@pbouda-kubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sylvain,

Am Mittwoch 27 Mai 2015, 17:03:00 schrieb Sylvain Raybaud:
> 
> A few packages in buildroot already use scons (exfat, exfat-utils,
> benejson, gpsd). Their build commands look like this:
> 
> FOO_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
> FOO_SCONS_OPTS = "prefix=/usr"
> 
> define FOO_BUILD_CMDS
>         cd $(@D) && \
> 	 $(FOO_SCONS_ENV) \
> 	 CROSS=$(TARGET_CROSS) \
> 	 $(SCONS) $(FOO_SCONS_OPTS)
> endef
> 

I had a similar problem recently, I had to change my SConstruct file, so that 
the CROSS variable is actually used in the target build process. The lines I 
added are:

if 'CROSS' in os.environ:
        cross = os.environ['CROSS']
        env.Append(CROSS = cross)
        env.Replace(CC = cross + 'gcc')
        env.Replace(CXX = cross + 'g++')
        env.Replace(LD = cross + 'ld')

Best,
Peter


-- 
http://www.peterbouda.eu
