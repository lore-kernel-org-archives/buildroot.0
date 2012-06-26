From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Jun 2012 11:43:12 -0300
Subject: [Buildroot] [PATCH 3/3] libpcap: canusb support needs pthreads
In-Reply-To: <20120626162321.0859b162@skate>
References: <1340720390-22117-1-git-send-email-gustavo@zacarias.com.ar>
 <1340720390-22117-3-git-send-email-gustavo@zacarias.com.ar>
 <20120626162321.0859b162@skate>
Message-ID: <4FE9CA80.7050203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/26/12 11:23, Thomas Petazzoni wrote:

> Le Tue, 26 Jun 2012 11:19:50 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
> 
>> canusb support in libpcap uses pthreads but the configure script doesn't
>> account for -lpthread usage so it doesn't get added into LIBS which in
>> turn doesn't add the appropiate entry in pcap-config, causing build
>> failures for programs that link to libpcap that don't use pthreads
>> themselves (for example tcpdump).
>> Also add the conditional dependency on BR2_PACKAGE_LIBUSB for canusb.
> 
> So maybe we need an additional BR2_TOOLCHAIN_HAS_THREADS dependency
> somewhere?
> 
> Thomas

canusb support is autodetected, which basically looks for linux and
libusb-1.
In fact there's another patch from someone else that enables (sic) the
disable option which isn't functional for the current release of
libpcap, so any tweak in the package won't work without it.
And IIRC libusb-1 needs threads, and if there's no libusb there's no
canusb which is the only bit that uses threads, so i think libusb should
probably be fixed rather than libpcap regarding that.
I'll give it a shot later to confirm or deny this and make a proper patch.
In any case it would be something else appart from what this patch fixes
(a big build failure with newish binutils).
Regards.
