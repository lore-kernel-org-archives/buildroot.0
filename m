From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Mar 2015 13:52:58 +0200
Subject: [Buildroot] [PATCH v2] cmake: don't use any header available in
 $(HOST_DIR)/usr/include
In-Reply-To: <20150305123148.3702fccc@free-electrons.com>
References: <1425516333-3234-1-git-send-email-fabio.porcedda@gmail.com>
 <20150305070255.GY15668@tarshish>
 <20150305123148.3702fccc@free-electrons.com>
Message-ID: <20150305115258.GZ15668@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 05, 2015 at 12:31:48PM +0100, Thomas Petazzoni wrote:
> On Thu, 5 Mar 2015 09:02:55 +0200, Baruch Siach wrote:
> > On Thu, Mar 05, 2015 at 01:45:33AM +0100, Fabio Porcedda wrote:
> > > +# Get rid of -I* options to prevent that a header avaiable in
> > > +# $(HOST_DIR)/usr/include is used instead of a cmake one, e.g. lzma*
> > > +# headers of the xz package
> > > +HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed s/-I[^\ ]*//)
> > 
> > How about (untested):
> > 
> > 	HOST_CMAKE_CFLAGS = $(filter-out -I%,$(HOST_CFLAGS))
> 
> It unfortunately works only if the form:
> 
> 	-I/foo/bar
> 
> is used. If you use:
> 
> 	-I /foo/bar
> 
> which is valid for gcc, then filter-out will filter the -I but
> not /foo/bar.

Right. But the original sed expression doesn't work either. This one seems to 
work:

	s/[[:space:]]-I[[:space:]]*[^\ ]*//

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
