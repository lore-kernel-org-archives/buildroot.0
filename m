From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Feb 2018 10:27:13 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 3/6] pkgconf: add
 host-pkg-config wrapper
In-Reply-To: <20180221225010.4b4228aa@windsurf.lan>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-4-gael.portay@savoirfairelinux.com>
 <20180221225010.4b4228aa@windsurf.lan>
Message-ID: <0e296fe2-3359-581f-6d3d-d3bc3cac06eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-02-18 22:50, Thomas Petazzoni wrote:
> Hello,
> 
> +Peter, Yann, Arnout, there's a question below about a small change but
> has a big impact.
> 
> On Wed, 21 Feb 2018 09:27:58 -0500, Ga?l PORTAY wrote:
>> The host-pkg-config wrapper gets package data compiled for host.
>>
>> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
>> ---
>>  package/pkgconf/host-pkg-config | 4 ++++
>>  package/pkgconf/pkgconf.mk      | 6 ++++--
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>  create mode 100644 package/pkgconf/host-pkg-config
>>
>> diff --git a/package/pkgconf/host-pkg-config b/package/pkgconf/host-pkg-config
>> new file mode 100644
>> index 0000000000..3362a3f927
>> --- /dev/null
>> +++ b/package/pkgconf/host-pkg-config
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +PKGCONFDIR=$(dirname "$0")
>> +DEFAULT_PKG_CONFIG_PATH=${PKGCONFDIR}/../lib/pkgconfig:${PKGCONFDIR}/../share/pkgconfig
>> +PKG_CONFIG_PATH=${PKG_CONFIG_PATH:-${DEFAULT_PKG_CONFIG_PATH}} exec ${PKGCONFDIR}/pkgconf "$@"
> 
> I've been thinking about this for a while, and I remember having a
> discussion about this with some other Buildroot developer a while ago.
> I think the most correct thing to do would be:
> 
>  $(HOST_DIR)/bin/pkg-config returns results valid for native compilation
> 
>  $(HOST_DIR)/bin/<tuple>-pkg-config returns results valid for cross-compilation

 This sounds like a good idea, but as you note below, could lead to breakage as
well.

 An alternative would be (IIRC this idea was launched by ThomasDS (added in Cc)):

$(HOST_DIR)/bin/ contains binaries valid for native compilation (i.e. no
cross-compiler, cross-pkg-config, ...)

$(HOST_DIR)/<tuple>/bin contains binaries valid for cross-compilation

When building for host, PATH contains $(HOST_DIR)/bin

When building for target, PATH contains $(HOST_DIR)/<tuple>/bin:$(HOST_DIR)/bin


 So let's analyse that option:

> I.e, the current pkg-config wrapper should be renamed
> <tuple>-pkg-config, and pkg-config should behave like a normal native
> pkg-config, except that it provides results for libraries located in
> $(HOST_DIR).
> 
> The autoconf PKG_CHECK_MODULES() macro uses PKG_PROG_PKG_CONFIG(),
> which internally uses AC_PATH_TOOL(). And AC_PATH_TOOL() will first
> search for the program with the host machine tuple, and warn if the
> program cannot be found with this tuple. From
> https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/Generic-Programs.html:
> 
> """
> When cross-compiling, this macro will issue a warning if no program
> prefixed with the host type could be found. For more information, see
> Specifying Target Triplets. 

 Weird, I checked a couple of log files and I could see no such warning. Ah,
that's because we pass PKG_CONFIG=... in the environment. Is it the idea to
remove that from the environment then?

 Anyway, the PATH-based alternative will not remove this warning, but that
shouldn't be different from the current situation.

> """
> 
> I know this change will:
> 
>  - Potentially break a number of packages we have in Buildroot, which
>    directly use pkg-config without first trying to use
>    <tuple>-pkg-config

 I.e. anything not using autotools? Well, most will probably heed the
PKG_CONFIG=... in the environment.

 The PATH-based alternative doesn't have this potential breakage.


>  - Potentially break a number of downstream users who are using
>    pkg-config.

 The PATH-based alternative reduces this problem, downstream users just have to
add $(HOST_DIR)/tuple/bin to their path (and Buildroot will do this for post-xxx
scripts).


> However:
> 
>  - It would solve that once you add $(HOST_DIR)/bin to your PATH, you
>    cannot anymore do native builds because "pkg-config" returns results
>    that are not relevant for native builds. I already saw a number of
>    people affected by this.

 The PATH-based alternative solves this as well.

 Note BTW that neither alternative solves the problem when building a host-tool
during a target build (and yes, we have seen this problem already in some
packages). AFAICS, autotools will also for host builds use the PKG_CONFIG passed
in the environment or discovered through the tuple. Same for CMake.


>  - It would comply with the standard autoconf expectations.

 With the PATH-based alternative, it might make sense to have the cross-stuff
both in $(HOST_DIR)/bin with the tuple prefix, and in $(HOST_DIR)/tuple/bin
without the prefix. That way, we get the advantages of both: comply with
autoconf expectations, and avoid breaking packages or downstream users.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
