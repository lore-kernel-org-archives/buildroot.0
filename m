From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 29 Oct 2008 04:09:59 -0700
Subject: [Buildroot] [buildroot 0005714]: bug with jamvm + concierge +
	classpath
Message-ID: <7ae02f3ea081d686e194934a8985a792@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5714 
====================================================================== 
Reported By:                sylvain
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5714
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-24-2008 05:46 PDT
Last Modified:              10-29-2008 04:09 PDT
====================================================================== 
Summary:                    bug with jamvm + concierge + classpath
Description: 
I work on arm9.

I try with the tarball of 22/09/2008 

When I compil busyboc + classpath + jamvm + concierge I get something like
:

libtool: link:
/home/sylvain/FSEmbarque/maChaineDeCompil/usr/bin/arm-linux-uclibc-gcc -Os
-I/home/sylvain/FSEmbarque/maChaineDeCompil/usr/include
-I/home/sylvain/FSEmbarque/maChaineDeCompil/include
--sysroot=/home/sylvain/FSEmbarque/maChaineDeCompil/ -isysroot
/home/sylvain/FSEmbarque/maChaineDeCompil -msoft-float -g -O2 -Wall -W -o
mkg3states mkg3states.o  -L/home/sylvain/FSEmbarque/maChaineDeCompil/lib
../port/.libs/libport.a /usr/lib/libjpeg.so -lz -lm -lc
/usr/lib/libjpeg.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[3]: *** [mkg3states] Erreur 1
make[3]: *** Attente des t?ches non termin?es....
libtool: link:
/home/sylvain/FSEmbarque/maChaineDeCompil/usr/bin/arm-linux-uclibc-gcc -Os
 -I/home/sylvain/FSEmbarque/maChaineDeCompil/usr/include
-I/home/sylvain/FSEmbarque/maChaineDeCompil/include
--sysroot=/home/sylvain/FSEmbarque/maChaineDeCompil/ -isysroot
/home/sylvain/FSEmbarque/maChaineDeCompil -msoft-float -shared 
.libs/tif_aux.o .libs/tif_close.o .libs/tif_codec.o .libs/tif_color.o
.libs/tif_compress.o .libs/tif_dir.o .libs/tif_dirinfo.o
.libs/tif_dirread.o .libs/tif_dirwrite.o .libs/tif_dumpmode.o
.libs/tif_error.o .libs/tif_extension.o .libs/tif_fax3.o
.libs/tif_fax3sm.o .libs/tif_flush.o .libs/tif_getimage.o .libs/tif_jpeg.o
.libs/tif_luv.o .libs/tif_lzw.o .libs/tif_next.o .libs/tif_ojpeg.o
.libs/tif_open.o .libs/tif_packbits.o .libs/tif_pixarlog.o
.libs/tif_predict.o .libs/tif_print.o .libs/tif_read.o .libs/tif_strip.o
.libs/tif_swab.o .libs/tif_thunder.o .libs/tif_tile.o .libs/tif_unix.o
.libs/tif_version.o .libs/tif_warning.o .libs/tif_write.o .libs/tif_zip.o 
-Wl,--whole-archive ../port/.libs/libport.a -Wl,--no-whole-archive 
-L/home/sylvain/FSEmbarque/maChaineDeCompil/lib /usr/lib/libjpeg.so -lz
-lm -lc  -isysroot /home/sylvain/FSEmbarque/maChaineDeCompil -msoft-float 
   -Wl,-soname -Wl,libtiff.so.3 -o .libs/libtiff.so.3.8.2
/usr/lib/libjpeg.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[3]: *** [libtiff.la] Erreur 1
make[3]: quittant le r?pertoire ?
/home/sylvain/FSEmbarque/buildroot-20081024/build_arm/tiff-3.8.2/libtiff
?
make[2]: *** [all] Erreur 2
make[2]: quittant le r?pertoire ?
/home/sylvain/FSEmbarque/buildroot-20081024/build_arm/tiff-3.8.2/libtiff
?
make[1]: *** [all-recursive] Erreur 1
make[1]: quittant le r?pertoire ?
/home/sylvain/FSEmbarque/buildroot-20081024/build_arm/tiff-3.8.2 ?

====================================================================== 

---------------------------------------------------------------------- 
 tpetazzoni - 10-24-08 06:55  
---------------------------------------------------------------------- 
The problem at the beginning is that it tries to link with the host libjpeg
instead of the target libjpeg. Not sure why, though, and I don't really get
why setting TARGET_DIR would solve the problem. 

---------------------------------------------------------------------- 
 Correa - 10-24-08 10:35  
---------------------------------------------------------------------- 
It did build ok for me using avr32 as target.

I'm using latest svn (r23778 at the moment).
Try updating. There were changes in the Makefile.autotools.in that might
affect your build. 

---------------------------------------------------------------------- 
 sylvain - 10-28-08 02:05  
---------------------------------------------------------------------- 
Thanks for the help.

tpetazzoni you are right to modify the TARGET_DIR do not resolve the
problem permanently, I was just lucky and I don t know why..

(Correa) I tried to update my release, unfortunatly I have the same
bug...
I should have a a difference with your linux settings... That's stuff are
not really easy to solve...






I did other investigations to understand the problem.
In fact, when I compile classpath, it compiles its dependences : libjpeg,
libtiff, etc....

And inside tiff's makefile LIBTOOL try to resolve the dynamics shared
libraries and it resolve -ljpeg by /usr/lib/libjpeg.so instead of
<mycrosscompilToolchain>/usr/bin/libjpeg.so ...

I try to understand libtool and resolve the problem but the libtool script
are more or less a nightmare to understand.


If you have some idea you are really welcome :-)) 

---------------------------------------------------------------------- 
 tpetazzoni - 10-28-08 02:35  
---------------------------------------------------------------------- 
After the failure, what's the contents of
build_<ARCH>/staging_dir/usr/lib/libjpeg.la ? 

---------------------------------------------------------------------- 
 sylvain - 10-28-08 03:28  
---------------------------------------------------------------------- 
I found a hack to correct my problem it's quite "dirty" but this time I can
reproduce it.

libtool when it tries to resolve the compile flag "-ljpeg" (it's use by
tiff/port, tiff/tool, tiff/libtiff) looks inside the /usr/lib/libjpeg.la
the install directory of the jpeg library which is "/usr/lib/".
so it translate "-ljpeg" -> /usr/lib/libjpeg.so...


If I change the last line of the file  :
# Directory that this library needs to be installed in:
# libdir='/usr/lib'
libdir='<path to your cross-compile toolchain>/usr/lib' 

the full compilation is alright and my embedded jvm and osgi works
sucessfully !!!

Now I need to understand which buildroot compilation variable I have to
change for libtool in order to set the correct libraries path. 

---------------------------------------------------------------------- 
 sylvain - 10-28-08 03:41  
---------------------------------------------------------------------- 
(tpetazzoni)
I came back to my old settings with the correct path inside
/usr/lib/libjpeg.la and I reproduce the bug.

1 thing (maybe important to resolve the bug) is that I changed the
destination directory of the toolchain and the kernel header to
"/home/sylvain/FSEmbarque/maChaineDeCompil2/". It s not anymore inside
"build_<ARCH>/staging_dir/".



so my libjpeg.la contains :
# libjpeg.la - a libtool library file
# Generated by ltmain.sh - GNU libtool 1.2

# The name that we can dlopen(3).
dlname=''

# Names of this library.
library_names='libjpeg.so.62.0.0 libjpeg.so.62 libjpeg.so'

# The name of the static archive.
old_library='libjpeg.a'

# Libraries that this one depends upon.
dependency_libs=''

# Version information for libjpeg.
current=62
age=0
revision=0

# Directory that this library needs to be installed in:
libdir='/home/sylvain/FSEmbarque/maChaineDeCompil2/usr/lib'

It looks correct...

thanks for the help.

 

---------------------------------------------------------------------- 
 tpetazzoni - 10-28-08 08:53  
---------------------------------------------------------------------- 
Hm, strange. Will try to reproduce it here to see what goes wrong.

BTW, my name is Thomas Petazzoni, and I'm the colleague of Michael
Opdenacker, at Free-Electrons. Didn't you meet him two weeks ago during a
training ? 

---------------------------------------------------------------------- 
 tpetazzoni - 10-28-08 16:03  
---------------------------------------------------------------------- 
Ok, I tried to reproduce your issue without any of the patches I currently
have on Buildroot (with my patches, I'm not able to reproduce). However,
without my patches, I face the following problem during libtiff
./configure:

checking for inflateEnd in -lz... no
configure: error: Zlib library not found at
/home/thomas/local/buildroot/build_arm/staging_dir/lib

Could you try with the patch I'll attach to this bug ? 

---------------------------------------------------------------------- 
 sylvain - 10-29-08 00:26  
---------------------------------------------------------------------- 
>Ok, I tried to reproduce your issue without any of the patches I currently
have >on Buildroot (with my patches, I'm not able to reproduce). However,
without my >patches, I face the following problem during libtiff
./configure:

>checking for inflateEnd in -lz... no
>configure: error: Zlib library not found at
>/home/thomas/local/buildroot/build_arm/staging_dir/lib

>Could you try with the patch I'll attach to this bug ?
Yes I gonna try.
I have to duplicate my buildroot folder before, I post when I finish. 

---------------------------------------------------------------------- 
 sylvain - 10-29-08 02:00  
---------------------------------------------------------------------- 
Ok I tried the patch and it correct my bug !!!

Thanks a lot.

WARNING : don t forget to declare in your PATH "STAGING_DIR/usr/bin"

 

---------------------------------------------------------------------- 
 tpetazzoni - 10-29-08 04:09  
---------------------------------------------------------------------- 
Hum, interesting. I'm not sure why the patch I provided fixes the bug.

However, you mention that you must add $(STAGING_DIR)/usr/bin to your
PATH. What fails if you don't do that ? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-24-08 05:46  sylvain        New Issue                                    
10-24-08 05:46  sylvain        Status                   new => assigned     
10-24-08 05:46  sylvain        Assigned To               => buildroot       
10-24-08 05:49  sylvain        Issue Monitored: sylvain                     
10-24-08 05:50  sylvain        Issue End Monitor: sylvain                    
10-24-08 06:55  tpetazzoni     Note Added: 0014104                          
10-24-08 10:35  Correa         Note Added: 0014114                          
10-28-08 02:05  sylvain        Note Added: 0014414                          
10-28-08 02:35  tpetazzoni     Note Added: 0014444                          
10-28-08 03:28  sylvain        Note Added: 0014464                          
10-28-08 03:38  sylvain        Note Added: 0014474                          
10-28-08 03:39  sylvain        Note Edited: 0014474                         
10-28-08 03:40  sylvain        Note Edited: 0014474                         
10-28-08 03:41  sylvain        Note Edited: 0014474                         
10-28-08 08:53  tpetazzoni     Note Added: 0014484                          
10-28-08 16:03  tpetazzoni     Note Added: 0014504                          
10-28-08 16:03  tpetazzoni     File Added: ldflags-fix-from-daniel              
     
10-29-08 00:22  sylvain        Note Added: 0014524                          
10-29-08 00:22  sylvain        Note Deleted: 0014524                        
10-29-08 00:26  sylvain        Note Added: 0014534                          
10-29-08 02:00  sylvain        Note Added: 0014544                          
10-29-08 02:00  sylvain        Note Edited: 0014544                         
10-29-08 04:09  tpetazzoni     Note Added: 0014554                          
======================================================================
