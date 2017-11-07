From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Nov 2017 00:21:01 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
Message-ID: <58b43590-da5e-4ae0-4745-3b009c522a30@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 17:06, Thomas Petazzoni wrote:
[snip]
> What remains to be done?
> ========================
> 
>  - Completely get rid of the global HOST_DIR, TARGET_DIR and
>    STAGING_DIR definitions, so that nothing uses them, and they really
>    become per-package variables.

 I don't think that that's needed.


>  - While the toolchain sysroot, pkg-config paths and host RPATHs are
>    properly handled, there are quite certainly a lot of other places
>    that have absolute paths that won't work well with per-package SDK,
>    and that need to be adjusted.
> 
>  - Perhaps use a temporary per-package SDK and target directory when
>    building a package, and rename it to the final name once the
>    package has finished building. This would allow to detect
>    situations where the per-package SDK directory of package A
>    contains absolute paths referring to the per-package SDK directory
>    of package B. Such absolute paths are wrong, but we currently don't
>    see them because the per-package SDK directory for package B still
>    exists.


 Add an instrumentation hook:

	! grep -r $(PER_PACKAGE_DIR) $(HOST_DIR) $(TARGET_DIR)

That will immediately point to the culprit package. Maybe you want to avoid
grepping through gigabytes of data over and over again so perhaps use the same
approach as check-bin-arch.


 But actually,

> 
>  - Many other issues that I'm sure people will report.
> 
> Comparison with Gustavo's patch series
> ======================================
> 
> Gustavo Zacarias did a previous implementation of this, available in
> http://repo.or.cz/buildroot-gz.git/shortlog/refs/heads/pps3-next. Compared
> to Gustavo's patch series, this patch series:
> 

[snip]
>  - I haven't integrated Gustavo patches that move from $(shell ...) to
>    using backticks to delay the evaluation of
>    STAGING_DIR/HOST_DIR/TARGET_DIR:
> 
>    http://repo.or.cz/buildroot-gz.git/commitdiff/0c11c60865f1445830643bb404f92c20d563260c
>    http://repo.or.cz/buildroot-gz.git/commitdiff/207d2248ec8542293b6201b5c86f971021a3a591
>    http://repo.or.cz/buildroot-gz.git/commitdiff/7f6a69819fbb176e29a1c3a53b4a76efe87dad15
>    http://repo.or.cz/buildroot-gz.git/commitdiff/3328a9745eee555f5e5ef7df835afc26612ecd7b
>    http://repo.or.cz/buildroot-gz.git/commitdiff/45a9d8c2aa6f3c0d2d8ed989d843890025faa3e8

 Independently of the PPS feature, these are useful patches I think. Can you
submit them?


>  - I haven't looked at Qt specific issues, such as the ones fixed by
>    Gustavo in:
> 
>    http://repo.or.cz/buildroot-gz.git/commitdiff/643e982e635f4386ccefcda9da4b84536af84d04

 Yeah, and something similar for CMake as well...

 I'm a bit worried about python and friends. They may embed paths in all kinds
of weird places. Like sysconfigdata has paths to compilers and stuff.

 But now I think about it a little more: is there really a problem if e.g. a .la
file refers to a library in one of the other per-package dirs? The library does
exist there after all... The only thing we need to avoid is that a package
installs something in a different package's per-package dir. You may of course
end up with references to indirect dependencies, but they are still dependencies
that are tracked by Buildroot so they're OK.

 So how about this: at the end of the package build, we make the per-package dir
readonly. An evil package can of course still make it readwrite again before
installing something, but it's not very likely.

 Cleaning up all references to other per-package dirs is only really needed if
we want to make a tarball of the directory to save as a seed for a later build.
But we're not there yet by a long shot, so let's just ignore that use case.


 Regards,
 Arnout

> 
>  - I am not doing all the .la files, *-config, *.prl, etc. tweaks that
>    Gustavo is doing in:
> 
>    http://repo.or.cz/buildroot-gz.git/commitdiff/3f7b227b4c8e4514df6e5d54f88fcfb3a3a4bae0
> 
>    It is part of the "remaining absolute paths that need to be fixed"
>    item that I mentionned above.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
