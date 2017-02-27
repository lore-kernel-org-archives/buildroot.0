From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Feb 2017 17:06:37 +0200
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
 <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
Message-ID: <20170227150637.ljo2c6dv3izstddn@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Feb 27, 2017 at 03:58:54PM +0100, Arnout Vandecappelle wrote:
> On 24-02-17 09:25, Thomas Petazzoni wrote:
> > On Fri, 24 Feb 2017 15:07:13 +1100, Sam Bobroff wrote:
> > 
> >> Yes, absolutely, and I really don't know how we should handle it. I
> >> searched fairly hard for another solution but the only other one seems
> >> to be to rewrite gobject-introspection completely and the other
> >> projects that have attempted this have used the same host-qemu approach
> >> (that's yocto and cygwin).
> > Can you summarize what is Qemu used for in the context of building
> > gobject-introspection ?
> > 
> > If it's to generate some architecture-specific file, can we
> > pre-generate it, and bundle it with Buildroot ?
> 
>  As far as I can see, it just runs ldd under qemu, to find the paths to the
> libraries that will actually be used (i.e., the libraries that have to be
> introspected, I guess). That's why Jerome suggested to use his cross-ldd
> scriptlet [1], which would also work with musl and uClibc.
> 
>  However, as far as I understand, it really only needs to find a list of shared
> libraries used by a program. In our case, instead of going through ldd, we can
> just use readelf because there is normally only a single instance of each SONAME
> in the target.

My understanding is that the process is more involved than that. Quoting the 
Yocto summary[1]:

  The data is generated when building such a library, by linking the library 
  with a small executable binary that asks the library to describe itself, 
  then executing the binary and processing its output.

I didn't verify this myself yet.

[1] https://lists.yoctoproject.org/pipermail/yocto/2016-April/029579.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
