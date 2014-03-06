From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 18:45:00 +0100
Subject: [Buildroot] [PATCH 08/12] pkg-infra: don't use DL_DIR as
 scratchpad for temporary VCS checkouts
In-Reply-To: <CAHXCMMJ-rQzL+Jkn_9QNw5y6t4W+ADQATR1JWe_bWJjM3h+YDg@mail.gmail.com>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
 <46c87bc586c8fcf01ab538c6590c7a3cb4658344.1394055621.git.yann.morin.1998@free.fr>
 <CAHXCMMJ-rQzL+Jkn_9QNw5y6t4W+ADQATR1JWe_bWJjM3h+YDg@mail.gmail.com>
Message-ID: <5318B41C.1010801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/14 11:25, Samuel Martin wrote:
[snip]
>> +
>> > +cd "${BUILD_DIR}"
>> > +# Remove leftovers from a previous failed run
>> > +rm -rf "${repodir}" "${output}.tmp"
>> > +
>> >  ${CVS} -z3 -d":pserver:anonymous@${repo}" \
>> > -       co -d "${basename}" -r ":${rev}" -P "${rawname}"
>> > -tar czf "${output}" "${basename}"
>> > -rm -rf "${basename}"
>> > +       co -d "${repodir}" -r ":${rev}" -P "${rawname}"
>> > +tar czf "${output}.tmp" "${repodir}"
>> > +mv "${output}.tmp" "${output}"

> You move the temporary repository in the package build_dir.
> Maybe the temporary output archive should be generated there as well,
> so that the mv command will only move something valid.

 No! If the DL_DIR is on a different mount point than the build dir (e.g.
on a shared network drive), then the move will become a copy so
non-atomic. We want to avoid that!


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
