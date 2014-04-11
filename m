From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 11 Apr 2014 15:39:31 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-10
In-Reply-To: <20140411141346.49e1251a@skate>
References: <20140411063008.70B85100F1F@stock.ovh.net>
 <87d2go5oz3.fsf@dell.be.48ers.dk> <20140411093044.07729d79@skate>
 <87y4zc47il.fsf@dell.be.48ers.dk>
 <20140411065158.0a9308de@core2quad.morethan.org>
 <20140411141346.49e1251a@skate>
Message-ID: <20140411123931.GZ4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Apr 11, 2014 at 02:13:46PM +0200, Thomas Petazzoni wrote:
> On Fri, 11 Apr 2014 06:51:58 -0500, Mike Zick wrote:
> 
> > >  > This looks weird, and I don't have a good explanation. For now,
> > >  > I've removed this bogus file, and we'll see if this occurs again
> > >  > in the future.
> > > 
> > > Agreed. Thanks for looking into it!
> > > 
> > 
> > That reads like wget behavior, if interrupted and without the
> > "continue" option.
> 
> Our wget download method normally downloads to a different temporary
> file, and then moves the temporary file to the final location once the
> download was successful. Hum, but it doesn't remove the temporary file
> *before* starting the download:
> 
> define DOWNLOAD_WGET
>         test -e $(DL_DIR)/$(2) || \
>         ($(WGET) -O $(DL_DIR)/$(2).tmp '$(call qstrip,$(1))' && \
>          mv $(DL_DIR)/$(2).tmp $(DL_DIR)/$(2)) || \
>         (rm -f $(DL_DIR)/$(2).tmp ; exit 1)
> endef
> 
> So if you have the following sequence:
> 
>  1/ wget downloads into tarball.tar.gz.tmp
> 
>  2/ wget is interrupted by Ctrl+C, the .tmp file remains
> 
>  3/ the build is restarted, so wget runs again, and downloads the file
>     again
> 
>  4/ the download is successful, and the .tmp file is renamed to the
>     final name
> 
> Would this sequence be possible?

That's apparently what happened at 
http://autobuild.buildroot.net/results/d19/d1967ec1b19211d209b6f476654bb30039da94fa/build-end.log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
