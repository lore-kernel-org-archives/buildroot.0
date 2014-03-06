From: Michael D <me@md-5.net>
Date: Thu, 06 Mar 2014 17:44:42 +1100
Subject: [Buildroot] Addition of packages: libvirt & qemu (target)
In-Reply-To: <5316C8CD.7010806@mind.be>
References: <53144FFF.10702@md-5.net> <5316C8CD.7010806@mind.be>
Message-ID: <5318195A.5020104@md-5.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Just out of curiosity, what is your use case for qemu on the target?
> IIRC for Yann is was just a let's-see-if-it-can-be-done hack, that's why
> he never pushed it anymore. I can imagine borderline buildroot uses which
> have lxr or docker on the target, but full-fledged qemu?


Couple QEMU with an x86_64 host and KVM, suddenly buildroot becomes a 
minimal hypervisor in a box. Now lets imagine we insert a buildroot USB 
/ CD into a server.
The server loads the entire system into 40mb of its memory, grabs an IP 
and configuration parameters via dhcp, a small embedded binary reads 
these settings, looks at what VMs are stored on the server and starts 
running them. You can effectively make buildroot a quick way to spin up 
ultra efficient and slim hypervisors.

 > You can typically also pass in LIBS="-lm" to configure.

I'll try rebuilding my toolchain with ulibc and passing -lm to 
configure. Hopefully that turns out well - is there a quick way to do 
this with an autotools .mk?

 > - more autobuilder instances;
Let me know what you need for that / what it entails.

Thanks
Michael

On 05/03/14 17:48, Arnout Vandecappelle wrote:
> On 03/03/14 10:48, Michael D wrote:
>> Hi guys,
>>
>> First up, thanks for buildroot, its a really cool tool, and I've enjoyed
>> using it thus far. After some discussion on IRC with y_morin, I'd like to
>> put forward that the libvirt package is added, and that qemu is adapted
>> to support being installed on the target as well.
>   Just out of curiosity, what is your use case for qemu on the target?
> IIRC for Yann is was just a let's-see-if-it-can-be-done hack, that's why
> he never pushed it anymore. I can imagine borderline buildroot uses which
> have lxr or docker on the target, but full-fledged qemu?
>
>
>> libvirt is a fairly
>> standard autotools package, and shouldn't require much work, although I
>> did notice ./configure checked for some host qemu binaries.
>>
>> You can see Yann's work on libvirt and target-qemu here:
>> https://gitorious.org/buildroot/buildroot/source/e09cf6e8d412cfd6163358fc7f58c83f44cc0a38:package/libvirt
>>
>> https://gitorious.org/buildroot/buildroot/source/14ac053363188981cf7fb78b589a9e27fb464483:package/qemu
>>
>>
>> and my inexperienced, hackjob work over here, updates the packages to
>> their latest versions and removes unneeded depends:
>> https://github.com/md-5/Multiplicity/tree/master/package
>>
>> libvirt requires the following depends to work:
>>
>> host-pkgconf lvm2 libnl libxml2 yajl
>>
>> In order for the configure script to detect yajl properly, it needs a
>> (e)glibc toolchain. This is due to yajl requiring -lm, which is not
>> linked into the test binary. A better solution than requiring (e)glibc
>> would be to patch libvirt's ./configure to link in -lm for the yajl test.
>   You can typically also pass in LIBS="-lm" to configure.
>
>> Yann's work on libvirt also depends on
>>
>> libgcrypt and gnutls
>>
>> which I assume add extra features. Ideally libvirt's depend section
>> should be updated if these (and any other feature enhancing) packages are
>> selected.
>>
>> Building Qemu for the target on the other hand is quite a bit more
>> complex due to the sheer number of configuration options available. In
>> particular it depends on a x86 based toolchain with threads, and
>>
>> host-pkgconf host-python libglib2 pixman
>>
>> I'm reasonably sure Qemu can compile and run on other arches, however
>> Yann has not included support for this. Ideally the final package in
>> buildroot would only require these 4 libraries to build, additional
>> depends and features should be added with their necessary options and
>> installed if desired (util-linux, some sound libraries, and a lot of
>> graphics libraries for jpg/png manipulation).
>>
>> Anyway, enough of me talking, it would be great to see these two packages
>> become properly integrated into buildroot, and I am hoping someone can
>> manage it.
>>
>> If it helps sweeten the deal, I'll be more than happy to donate some beer
>> money to the successful contributors, or donate to the buildroot project.
>> I'll also be more than happy to make sure these packages stay updated and
>> working.
>   We don't really have a way for accepting donations, but what we could
> use is:
>
> - more autobuilder instances;
>
> - sponsoring for the buildroot developer meeting.
>
>
>   Regards,
>   Arnout
>
>
>> Thanks
>> Michael Dardis
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>
