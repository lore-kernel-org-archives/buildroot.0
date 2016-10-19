From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Oct 2016 10:55:22 +0200
Subject: [Buildroot] [PATCH 00/93] TLP/PPS: package cleanup part 2
In-Reply-To: <487b6d27-cde3-da79-b88b-af45b3b11d6c@mind.be>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <487b6d27-cde3-da79-b88b-af45b3b11d6c@mind.be>
Message-ID: <f8bd87b0-1c73-6b40-870a-ad91bbed014c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-10-16 00:04, Arnout Vandecappelle wrote:
>
> On 17-10-16 18:05, gustavo.zacarias at free-electrons.com wrote:
>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>>
>> This patchset takes over from the first round of cleanup.
>>
>> It takes into account feedback on the patches that weren't applied for
>> the previous set and addressed them, like setting the proper host env
>> for host packages and other steps like configure and install for target
>> packages.
>  I reviewed the series, posted comments on some, and the ones that can go in
> have been added to a bundle:
>
> http://patchwork.ozlabs.org/bundle/arnout/gustavoz_target_make_env_2/
>
>  However, please first consider the question I asked in the cryptopp patch:
>
> HOST_CONFIGURE_OPTS already contains HOST_MAKE_ENV, so if
> HOST_CONFIGURE_OPTS is passed as the argument to MAKE, does it still make sense
> to pass it in the environment as well?

 I have been super stupid. Variables passed to make on the argument list do not
get propagated to the environment of subprocesses, unless they are already in
the environment or they are explicitly exported by the Makefile.

 Since the intention here is for PPS to add something like
BR_STAGING_DIR=$($(PKG)_STAGING_DIR)
to the environment, and use that to calculate the --sysroot argument in the
toolchain wrapper, it is clearly mandatory for this variable to be present in
the environment.

 That said, as I wrote earlier, I believe that all of this is not strictly
needed, because we can just export BR_STAGING_DIR from the Buildroot Makefile.
The value of that environment variable will be different for each package
because $(PKG) is different. So there is no need at all to add it to
TARGET_MAKE_ENV. But also, as I wrote earlier, it is a good idea to make sure
that all our packages properly use TARGET_MAKE_ENV.

 Regards,
 Arnout

>
>  I haven't marked the remaining ones as Changes Requested yet, that's a lot
> easier to do once the bundle has been merged. Oh, Thomas, there's really no need
> to manually add my Reviewed-by everywhere...
>
>
>  Regards,
>  Arnout
>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
