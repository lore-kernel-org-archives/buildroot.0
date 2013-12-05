From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 23:05:22 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-03
In-Reply-To: <20131205170715.7214aff4@skate>
References: <20131204073002.8453B101504@stock.ovh.net>
 <CAAXf6LXtNZD6gaLprTS5XbfZAd_10jcEeXL-yLik9ami0QRmmw@mail.gmail.com>
 <20131205170715.7214aff4@skate>
Message-ID: <52A0F8A2.3070708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/13 17:07, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 5 Dec 2013 16:59:31 +0100, Thomas De Schampheleire wrote:
>
>>>        bfin |              xlib_libX11-1.5.0 | NOK | http://autobuild.buildroot.net/results/a47c5d96f880af04b85bb6773e87d04f9d7c2864/
>>
>> The problem here is that xlib_libX11 needs dlfcn.h and dlopen, thus
>> !BR2_PREFER_STATIC_LIB.
>> Adding this 'depends on !BR2_PREFER_STATIC_LIB' to
>> package/x11r7/xlib_libX11 is the solution here. However, this requires
>> propagating this dependency to all packages that 'select' the
>> xlib_libX11 package, which is a very large amount of packages (105),
>> most of which are other X packages.
>>
>> Is this the way to go or is there a special handling of X packages
>> that I'm not aware of?
>> For example, should we simply add this dependency to the entire set of
>> X11 packages at package/x11r7/Config.in?
>> This would greatly reduce the amount of 'depends on
>> !BR2_PREFER_STATIC_LIB' additions, but may be too coarse-grained as
>> not every X11 library necessarily needs shared libraries (unless of
>> course xlib_libX11 is a dependency on all these libraries, I did not
>> check that).
>
> If xlib_libX11 needs shared library, then I believe there is no point
> in trying to use X.org on systems that don't support shared libraries,
> since xlib_libX11 is the fundamental library for X clients.
>
> Therefore, I would also suggest to simply disable all x11r7 packages
> when BR2_PREFER_STATIC_LIB is set.

  +1

  Cfr. 6c10f4 "xorg: needs thread support". That patch started out adding 
depends on BR2_TOOLCHAIN_HAS_THREADS to a few packages, but with all the 
reverse dependencies it was easier to just disable it for all or x11r7.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
