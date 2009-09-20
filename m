From: Palash Bandyopadhyay <palash0791@hotmail.com>
Date: Sun, 20 Sep 2009 09:32:02 -0700
Subject: [Buildroot] Is DirectFb.org down?
In-Reply-To: <87k4ztwq6n.fsf@macbook.be.48ers.dk>
References: <BLU126-W2171CCAFA65907A9231DA4C7DE0@phx.gbl>
	<87k4ztwq6n.fsf@macbook.be.48ers.dk>
Message-ID: <BLU126-W18776DC590E07BA3292058C7DE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thanks for the quick reply, Peter.
  It was just that I wanted to ask some questions to the DirectFB group. Am facing some problems getting DirectFB to work properly with MPlayer with the packages included with quite a few Buildroot versions.
  The mplayer version included in Buildroot is RC2, and on sending queries to mplayer, they ask me to use the latest mplayer version. Not that using it helped any :-(.   Digging further I tried to run a directfb application and that too failed.
  But I do have a question in buildroot and probably you would be the best person to answer that :-). Please bear with me as I am relatively new with BuildRoot as well as Linux.
  If we have a package in BuildRoot which depends on another package in buildroot and needs to include some header files from the other package how do I give the relative include path in the configure file?
  Here is the reason for my question:
   I enabled DirectFB in mplayer's configure (--enable-directfb). Built mplayer. Initially was getting an error in configure:

Checking for DirectFB ...
/var/tmp/portage/mplayer-1.0_rc1/temp/mplayer-conf-14171-11545.c:1:30: error:
directfb_version.h: No such file or directory

Searched through various forms and found that this is a known issue and that there is a patch for this :

==>
--- configure.old 2007-01-06 20:45:03.000000000 +0100
+++ configure 2007-01-06 21:08:52.000000000 +0100
@@ -3742,6 +3742,16 @@
}

if test "$_directfb" = yes; then
+ cat> $TMPC <
+int main(void) { IDirectFB *foo; DirectFBInit(0,0); return 0; }
+EOF
+ for _inc_tmp in "" -I/usr/local/include/directfb \
+ -I/usr/include/directfb -I/usr/local/include -I/usr/include; do
+ cc_check $_inc_tmp -ldirectfb && _directfb=yes && \
+ _inc_extra="$_inc_extra $_inc_tmp" && break
+ done
+
cat> $TMPC << EOF
#include 
int
==>     Now, that patch assumes that the included version of DirectFB is installed in the /usr folder. Now the version of directfb installed on the host machine might not match with the version of directfb that comes with buildroot (actually it is almost certain that it will not match).    So is there any constant/macro that I can use to patch up the configure file above so that it points to the directfb include path relative to buildroot, rather than the local version installed in the system? Thanks a lotRegards,Palash


----------------------------------------
> To: palash0791 at hotmail.com
> CC: buildroot at busybox.net
> Subject: Re: [Buildroot] Is DirectFb.org down?
> From: jacmet at uclibc.org
> Date: Sun, 20 Sep 2009 18:12:32 +0200
>
>>>>>> "Palash" == Palash Bandyopadhyay  writes:
>
> Hi,
>
> Palash> Hi,Probably not a question for this forum, but just in case
> Palash> anyone knows about this.I have not been able to access
> Palash> DirectFB.org since last Monday (9th Sept, 2009). Tried from 3
> Palash> different networks (in the US). Also had a couple of folks
> Palash> (from Europe) try to access it and they too haven't been able
> Palash> to.Does anyone know anything about this?
>
> I'm also unable to access it from here (Belgium). The directfb package
> in buildroot should still work though, as it falls back to the mirror on
> buildroot.net.
>
> --
> Bye, Peter Korsgaard

_________________________________________________________________
Hotmail: Powerful Free email with security by Microsoft.
http://clk.atdmt.com/GBL/go/171222986/direct/01/
