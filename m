From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Fri, 26 Sep 2014 11:00:41 +0200
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <1402783577.11294202.1394465935829.JavaMail.root@openwide.fr>
References: <CAM+bi4vYCeJc76ax8p1=Ldy-3ptinN7QT+yFZkYh0JpOghQ2tw@mail.gmail.com>
 <1402783577.11294202.1394465935829.JavaMail.root@openwide.fr>
Message-ID: <CAM+bi4sfYENe4DM8vDvEen+kSKqQWyyEAReD8NKX9gnHMArjgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Jeremy, all

I've been testing this for a few days and I've come to love it :)

For now, I've just found a problem.

I've tried to replace buildroot's default package definition for
libconfuse with my own (it's just a version bump),
but since I don't want to touch buildroot's master branch, I've added
a copy of package/libconfuse to the $BR2_EXTERNAL directory, alongisde
custom Config.in and external.mk

This, however, results in duplicated definitions, and although make
tries to solve it by overriding previously declared definitions with
the new ones, there are some conflicts:

On make libconfuse-source, the following is reported:
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:19:
warning: overriding recipe for target 'libconfuse-show-depends'
package/libconfuse/libconfuse.mk:19: warning: ignoring old recipe for
target 'libconfuse-show-depends'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:19:
warning: overriding recipe for target 'libconfuse-graph-depends'
package/libconfuse/libconfuse.mk:19: warning: ignoring old recipe for
target 'libconfuse-graph-depends'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:19:
warning: overriding recipe for target 'libconfuse-clean-for-rebuild'
package/libconfuse/libconfuse.mk:19: warning: ignoring old recipe for
target 'libconfuse-clean-for-rebuild'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:19:
warning: overriding recipe for target
'libconfuse-clean-for-reconfigure'
package/libconfuse/libconfuse.mk:19: warning: ignoring old recipe for
target 'libconfuse-clean-for-reconfigure'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:19:
warning: overriding recipe for target 'libconfuse-legal-info'
package/libconfuse/libconfuse.mk:19: warning: ignoring old recipe for
target 'libconfuse-legal-info'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:20:
warning: overriding recipe for target 'host-libconfuse-show-depends'
package/libconfuse/libconfuse.mk:20: warning: ignoring old recipe for
target 'host-libconfuse-show-depends'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:20:
warning: overriding recipe for target 'host-libconfuse-graph-depends'
package/libconfuse/libconfuse.mk:20: warning: ignoring old recipe for
target 'host-libconfuse-graph-depends'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:20:
warning: overriding recipe for target
'host-libconfuse-clean-for-rebuild'
package/libconfuse/libconfuse.mk:20: warning: ignoring old recipe for
target 'host-libconfuse-clean-for-rebuild'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:20:
warning: overriding recipe for target
'host-libconfuse-clean-for-reconfigure'
package/libconfuse/libconfuse.mk:20: warning: ignoring old recipe for
target 'host-libconfuse-clean-for-reconfigure'
/home/sslayer/Proyectos/ART/Firmware-SBC/external_packages/libconfuse/libconfuse.mk:20:
warning: overriding recipe for target 'host-libconfuse-legal-info'
package/libconfuse/libconfuse.mk:20: warning: ignoring old recipe for
target 'host-libconfuse-legal-info'



That is fine, and
https://github.com/martinh/libconfuse/archive/master/libconfuse-master.tar.gz
is downloaded.

Now, make libconfuse-extract reports the same log as above, but adds this:
>>> libconfuse master Extracting
gzip -d -c /home/sslayer/Proyectos/ART/Firmware-SBC/dl/libconfuse-master.tar.gz
| tar --strip-components=1 -C
/home/sslayer/Proyectos/ART/Firmware-SBC/ARTMidrange/output/build/libconfuse-master
 -xf -
>>> libconfuse master Extracting
gzip -d -c /home/sslayer/Proyectos/ART/Firmware-SBC/dl/libconfuse-master.tar.gz
| tar --strip-components=1 -C
/home/sslayer/Proyectos/ART/Firmware-SBC/ARTMidrange/output/build/libconfuse-master
 -xf -

It seems that it is trying to extract both versions, the one declared
on buildroot and the one declared by me outside buildroot's directory.
This is not very important since the end result is the same. However,
next step fails:



make libconfuse-patch reports this at the end of execution:

No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch failed!  Please fix libconfuse-0000-fix-configure-ac.patch!
package/pkg-generic.mk:146: recipe for target
'/home/sslayer/Proyectos/ART/Firmware-SBC/ARTMidrange/output/build/libconfuse-V2_7/.stamp_patched'
failed
make[1]: *** [/home/sslayer/Proyectos/ART/Firmware-SBC/ARTMidrange/output/build/libconfuse-V2_7/.stamp_patched]
Error 1
common.mk:54: recipe for target '_all' failed
make: *** [_all] Error 2


As can be seen, the patch is being applied to libconfuse-V2_7, which
is buildroot's declared version of libconfuse, while it should have
been applied to master version as I declared on the outside
buildroot's directory external makefile.

For now, I'll have to maintain a different buildroot branch in which
this package is modified, since I've not being able to override
buildroot's definition.

All in all, however, I'm very happy with the environment your Makefile
provides. I've done a couple changes that I hope will publish in the
following week for comments.

Kind regards,


2014-03-10 16:38 GMT+01:00 Jeremy Rosen <jeremy.rosen@openwide.fr>:
>
>
>>
>>
>> Hi, Jeremy
>>
>> Personally, I see potential in this.
>>
>> Have you thought of a way to include custom packages outside the
>> buildroot hierarchy?
>>
>>
>> Just as an example to illustrate the question, in the case of NOOBS
>> ( https://github.com/raspberrypi/noobs ), maybe the NOOBS application
>> (
>> https://github.com/raspberrypi/noobs/blob/master/buildroot/package/recovery/recovery.mk
>> )
>> itself isn't well suited for buildroot upstream for it's very
>> architecure dependent.
>>
>
>
> yes, this is exactly what I wanted to avoid, a project that has to
> include all of buildroot in a subdirectory and thus has problems
> following upstream.
>
> You can include external software in the raspaudio infrastructre because
> this infrastucture relies on the BR2_EXTERNAL feature of buildroot
> that allows external software to be built.
>
> You just need to include your own software via the external.mk and
> Config.in files that are at the root of raspaudio-based project.
>
> I need to test and document that properly, but it works
>
>
>>
>> So, have you thought of some way to place this directory outside
>> buildroots hierarchy but
>> let it be managed by buildroot? That, alongside your scripts and
>> makefiles would allow
>> to create root file systems with custom packages without "polluting"
>> the buildroot
>> directory/repository.
>>
>
>
> That's exactly the point of raspaudio. Feel free to test and report any
> problem you have. I have been the only one testing it so far and I
> might have missed some important stuff..
>
>
> Boucman



-- 
?lvaro G?mez Machado
