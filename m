From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Feb 2015 20:39:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-25
In-Reply-To: <20150226073014.150E51017F6@stock.ovh.net>
References: <20150226073014.150E51017F6@stock.ovh.net>
Message-ID: <20150226183931.GK2402@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, list,

On Thu, Feb 26, 2015 at 08:30:13AM +0100, Thomas Petazzoni wrote:
>       x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/b80a34a602b1241bc03cd43df1a269389d50e75c/

Nice.

So we package different versions of the same library under different names. 
The library is the Boehm-Demers-Weiser garbage collector that we carry under 
the names bdwgc (7.2f), and libgc (7.4.0). The following build order seems to 
triggers the error:

	bdwgc (guile dependency)
	guile
	libgc
	make

guile links with bdwgc as a mandatory dependency. make-4.1 configure script 
finds guile and pulls -lguile-2.0 and -lgc to its link command. But libgc 
builds before make, thus overwriting bdwgc. When make attempts to link with 
libgc it fails because of missing getcontext, a problem that is fixed in bdwgc 
by a local patch.

I have verified that building guile, libgc, and make, in that order, 
reproduced this build failure.

I suggest to just remove libgc in master, event though it was added first, 
because no other package depend on it.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
