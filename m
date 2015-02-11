From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Feb 2015 16:48:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-10
In-Reply-To: <20150211153442.5a122bc6@free-electrons.com>
References: <20150211073015.D49F7101159@stock.ovh.net>
 <20150211080111.GQ16955@sapphire.tkos.co.il>
 <20150211153442.5a122bc6@free-electrons.com>
Message-ID: <20150211144814.GV16955@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 11, 2015 at 03:34:42PM +0100, Thomas Petazzoni wrote:
> On Wed, 11 Feb 2015 10:01:11 +0200, Baruch Siach wrote:
> > On Wed, Feb 11, 2015 at 08:30:15AM +0100, Thomas Petazzoni wrote:
> > >         i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e3c42b2a8334d910f44f7a908371796a332f20e2/
> > >          arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/04940f2f0110bc3bb19cd96cc75a6d2d7e8affd5/
> > >         i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e733fac165c7b90b529855b0e1ccf92ad4ac9eca/
> > 
> > Looks like a broken cached tar file with missing files, as it only happens on 
> > your build server. Can you remove this file?
> 
> I'm not sure about this explanation, since the extract of the tarball
> doesn't complain at all:
> 
> [3m>>> host-google-breakpad 1373 Extracting[23m
> gzip -d -c /home/buildroot/instance-1/dl/google-breakpad-1373.tar.gz | tar --strip-components=1 -C /home/buildroot/instance-1/output/build/host-google-breakpad-1373  -xf -
> [3m>>> host-google-breakpad 1373 Patching[23m
> 
> If the tarball was somewhat partial or corrupted, I would expect to see
> at least some warnings here.

The tar file itself is not corrupted, but apparently the original svn checkout 
was partial. From the first failure log 
(http://autobuild.buildroot.net/results/98e/98e6a4a4046231598f5380e7ec5ac5a6833c5c41/build-end.log):

svn: warning: Error handling externals definition for 'host-google-breakpad-1373/src/third_party/lss':
svn: warning: Server sent unexpected return value (502 Bad Gateway) in response to OPTIONS request for 'http://linux-syscall-support.googlecode.com/svn/trunk/lss'
svn: warning: Error handling externals definition for 'host-google-breakpad-1373/src/third_party/glog':
svn: warning: Server sent unexpected return value (502 Bad Gateway) in response to PROPFIND request for '/svn/!svn/bc/97/trunk'
svn: warning: Error handling externals definition for 'host-google-breakpad-1373/src/third_party/protobuf/protobuf':
svn: warning: Server sent unexpected return value (502 Bad Gateway) in response to OPTIONS request for 'http://protobuf.googlecode.com/svn/trunk'
svn: warning: Error handling externals definition for 'host-google-breakpad-1373/src/testing':
svn: warning: Server sent unexpected return value (502 Bad Gateway) in response to OPTIONS request for 'http://googlemock.googlecode.com/svn/trunk'
svn: warning: Error handling externals definition for 'host-google-breakpad-1373/src/tools/gyp':
svn: warning: Server sent unexpected return value (502 Bad Gateway) in response to OPTIONS request for 'http://gyp.googlecode.com/svn/trunk'
Exported revision 1373.

> Maybe in any case, we should add a hash file to the google-breakpad
> package, so that we're sure the tarball being built is the right one.

I'm not sure the tar file generation is guaranteed to be deterministic.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
