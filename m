From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 17:32:15 +0100
Subject: [Buildroot] Target rebuilding
In-Reply-To: <4486164.oLnzyGq5cK@sagittae>
References: <4486164.oLnzyGq5cK@sagittae>
Message-ID: <50FACA8F.1040503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/01/13 12:04, J?r?me Pouiller wrote:
> Hello all,
>
> It is handy to do tests directly in target/. But after some time, it is
> necessary to make a new fresh target/ directory. The current procedure to do
> this is:
>
> * remove build/.root (or remove target/ if you want to throw all your work)
> * remove build/*/.stamp_target_installed
> * depending of you toolchain:
>    # remove stamps/ext-toolchain-installed (external)
>    # remove stamps/ct-ng-toolchain-installed (ctng)
>    # remove target/lib/libc.so.0 (buildroot)
> * launch make
>
> I think this process lacks of consistency. Idealy, this process should be:
>    rm -r target (depending if want to throw all your work)
>    rm build/*/.stamp_target_installed
>    make

  I agree that it lacks consistency, and I'm in favour of improving the 
consistency of stamp files.

>
> I suggest following changes:
>
>   1. Move build/.root to stamps/. Since it is hidden, many user forget this
> file exist.

  ACK.

>
>   2. All stamps files are in subdirectories of build/. I suggest to move
> stamps/ to build/stamps/

  I'm not convinced that that improves the consistency. If build/.root 
moves to stamps, than all directories in build/ are build directories. 
That sounds like a good idea to me.


>   3. Buildroot toolchain should create a stamp files to be uniform with other
> toolchains. In add, target/lib/libc.so.0 never exists when PREFER_STATIC_LIB
> is enable.

  ACK

  Note that the buildroot toolchain is on the way out (though it will 
probably take 3 more years before it's really gone), so don't put too 
much effort into improving it.


>   4. To be consistent stamps/*-toolchain-installed may be renamed
> stamps/.stamp_target_installed or stamps/.stamp_toolchain_target_installed or
> toolchain/.stamp_target_installed. We may add a README file to explain what is
> purpose of this apparently empty directory.

  I don't agree with this one. build/*/.stamp_* is stuff that is created 
by the package infrastructure. The toolchain stuff is not in the package 
infrastructure. So I wouldn't let it use the same pattern for stamp files.


>    5. stamps/ext-toolchain-installed currently copy libc in staging/ and in
> target/. It may be splited in two rules: stamps/ext-toolchain-target-installed
> and stamps/ext-toolchain-staging-installed.

  It could be split, but what is the advantage of that?


> What do you think about it?

  Let's see some patches! :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
