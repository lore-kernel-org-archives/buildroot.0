From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 10:28:11 +0100
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <201211291121.46456.manningc2@actrix.gen.nz>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <CAE21AQqs92x6=x_ELTWz7MqMLNDrq9VDXK17+P_2sB-7wc=JXw@mail.gmail.com>
 <50B68928.4010500@mind.be> <201211291121.46456.manningc2@actrix.gen.nz>
Message-ID: <50B72AAB.2020402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/11/12 23:21, Charles Manning wrote:
> On Thursday 29 November 2012 10:59:04 Arnout Vandecappelle wrote:
[snip]
>>    Could you (and Alex):
>> - tell us which host environment you have;
>> - re-run the failed build with 'V=1 make libglib2' and
>> post the failed command (should be something starting with:
>> /bin/sh ../../libtool  --tag=CC   --mode=link ...)
>> - post output/build/libglib2-2.30.3/config.log
>> - post output/build/libglib2-2.30.3/gobject/Makefile
>>
>>
>>    I vaguely remember having seen this problem before, but can't remember
>> if and how I solved it :-(
>
> Thanks for the help so far...
>
> I get this problem on my main work PC which is running Ubuntu 10.10 x32. It
> works OK on a machine with Ubuntu 10.04 x64.

  So the link command ran by libtool is:

/opt/buildroot/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -shared  -fPIC -DPIC 
.libs/libgobject_2_0_la-gatomicarray.o .libs/libgobject_2_0_la-gbinding.o .libs/libgobject_2_0_la-gboxed.o 
.libs/libgobject_2_0_la-gclosure.o .libs/libgobject_2_0_la-genums.o .libs/libgobject_2_0_la-gmarshal.o 
.libs/libgobject_2_0_la-gobject.o .libs/libgobject_2_0_la-gparam.o .libs/libgobject_2_0_la-gparamspecs.o 
.libs/libgobject_2_0_la-gsignal.o .libs/libgobject_2_0_la-gsourceclosure.o .libs/libgobject_2_0_la-gtype.o 
.libs/libgobject_2_0_la-gtypemodule.o .libs/libgobject_2_0_la-gtypeplugin.o .libs/libgobject_2_0_la-gvalue.o 
.libs/libgobject_2_0_la-gvaluearray.o .libs/libgobject_2_0_la-gvaluetransform.o .libs/libgobject_2_0_la-gvaluetypes.o 
-Wl,-rpath -Wl,/opt/buildroot/buildroot/output/build/libglib2-2.30.3/glib/.libs -Wl,-rpath 
-Wl,/opt/buildroot/buildroot/output/build/libglib2-2.30.3/gthread/.libs 
-L/opt/buildroot/buildroot/output/build/libglib2-2.30.3/glib/.libs ../glib/.libs/libglib-2.0.so ../
gthread/.libs/libgthread-2.0.so -lpthread 
/opt/buildroot/buildroot/output/build/libglib2-2.30.3/glib/.libs/libglib-2.0.so -lrt 
-L/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib -lffi  -Os -Wl,-Bsymbolic-functions   -Wl,-soname 
-Wl,libgobject-2.0.so.0 -Wl,-version-script -Wl,.libs/libgobject-2.0.ver -o .libs/libgobject-2.0.so.0.3000.3

  (Just to be sure, could you go to the gobject directory and run the
above command to verify that it fails in the same way?  And also add the
-v option to it, so we can see how exactly gcc calls ld.)

  There are two strange things with this:

1. There is no mention at all of /lib or /usr/lib so why is ld looking
for pthread in those paths?

2. libtool adds -L/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib
-- where does that come from?

  Maybe there's something fishy in your environment.  Can you run
env | grep /lib


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
