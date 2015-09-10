From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Sep 2015 10:26:36 +0200
Subject: [Buildroot] problem with stack protection,
 threads and static binaries
In-Reply-To: <1441871700.4298.49.camel@fahlgren-laptop>
References: <1441871700.4298.49.camel@fahlgren-laptop>
Message-ID: <55F13EBC.9060100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-09-15 09:55, Daniel Fahlgren wrote:
> Hi,
> 
> I've encountered a problem when enabling stack protection
> (BR2_ENABLE_SSP) in combination with static binaries that uses threads.
> The problem is that during start up the program gets a segfault in
> __pthread_initialize_minimal_internal(), and I think this might be the
> same issue as described in [1].
> 
> Investigation shows that the offending instruction is a:
> 
>   mov    %fs:0x28,%rax
> 
> where %fs is 0x00. The reason for that is that the pthread library is
> compiled with stack protection but __pthread_initialize_minimal_internal
> is called before __libc_setup_tls in static binaries.

 This sounds like a uClibc issue. Could you verify by testing with uClibc 0.9.33
and/or musl and/or glibc? And then take it to the uClibc-ng mailing list:
http://mailman.uclibc-ng.org/cgi-bin/mailman/listinfo/devel/

Just to be sure, putting Waldemar in Cc.


> 
> I have created an ugly patch to verify my hypothesis. With that patch
> the test program works, but what is the proper way to solve this issue?
> 
> Attached files (also at https://www.acc.umu.se/~guru/buildroot/)
> 
> add_broken_package.patch - add a test package to buildroot
> pthread-broken-1.0.0.tar.gz - the test package
> buildroot.config - buildroot config to use
> static-pthread.patch - my proof-of-concept patch

 Wow, great bug information! But in the future, please use a defconfig instead
of a full config to reduce the list load.

 Regards,
 Arnout

> 
> Best regards,
> Daniel Fahlgren
> 
> 1:
> http://lists.busybox.net/pipermail/buildroot/2014-February/088561.html
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
