From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 22:55:17 +0100
Subject: [Buildroot] [PATCH v2 1/1] protobuf: fix detection of
 __atomic_*() built-ins
In-Reply-To: <1455730981-6316-2-git-send-email-casantos@datacom.ind.br>
References: <1455204185-7124-1-git-send-email-casantos@datacom.ind.br>
 <1455730981-6316-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <56D21B45.5070500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/17/16 18:43, Carlos Santos wrote:
> - Use the recently introduced BR2_TOOLCHAIN_HAS_ATOMIC boolean.
> 
> - Import an upstream patch to fix error handling when atomic operations
>   are not detected. Without this patch the build fails due to a syntax
>   error instead of showing the proper message.
> 
> - Add a patch to configure.ac to check if libatomic is needed and force
>   linking to it (we will attempt to submit this upstream).
> 
> - Disable build for SPARC64 because it fails due to a missing definition
>   of Atomic64.
> 
> On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
> types are available built-in. The corresponding built-ins for 8-byte
> types, however, are implemented via libatomic, so requiring gcc >= 4.8.
> 
> In Buildroot, to simplify things, it was decided to require gcc 4.8 as
> soon as the architectures has at least one __atomic_*() built-in variant
> that requires libatomic.
> 
> Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
> *could* technically build with gcc 4.7. This is probably not a big deal,
> and we can live with requiring gcc 4.8 on PowerPC to build protobuf. The
> same restriction applies to SPARC.
> 
> The build for SPARC64 breaks even using the master branch of protobuf
> due to undefined references to some NoBarrier_Atomic*() functions.
> 
> Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 The comment in Config.in is perhaps a bit heavy, but it definitely doesn't hurt.

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
