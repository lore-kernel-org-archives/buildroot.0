From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Jul 2016 23:18:34 +0200
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build
 when libseccomp is enabled.
In-Reply-To: <1468007759371-ab3cc5cc-18ef6641-3fcef03d@mixmax.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
 <20160708212753.55d3c2ae@free-electrons.com>
 <1468006361981-b8d5773f-c47578b5-9b1f9581@mixmax.com>
 <20160708215031.17fe15de@free-electrons.com>
 <1468007759371-ab3cc5cc-18ef6641-3fcef03d@mixmax.com>
Message-ID: <6541a49e-6710-63d0-ee49-246d7673da19@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian, Thomas,

Le 08/07/2016 ? 21:55, Christian Stewart a ?crit :
> Thomas,
> 
> 
> On Fri, Jul 8, 2016 12:50 PM, Thomas Petazzoni
> thomas.petazzoni at free-electrons.com <mailto:thomas.petazzoni@free-electrons.com>
> wrote:
> 
>     OK. Can we remove unconditionally, or should we still keep it for
> 
>     BR2_STATIC_LIBS=y builds?
> 
> 
>     Perhaps we should pass -extldflags '$(TARGET_LDFLAGS)', since
> 
>     TARGET_LDFLAGS will automatically contain -static when
> 
>     BR2_STATIC_LIBS=y.
> 
> 
> That should be fine since extldflags is, I believe, only passed to C related
> linkers.
> 
>     For the specific case of runc, is ?RUNC_GOTAGS = static_build? needed
> 
>     when BR2_STATIC_LIBS=y ?
> 
> 
> That go tag is related to linking Go related code? In the runc code with a quick
> grep I see only one inconsequential place it's actually referenced:
> 
> Godeps/_workspace/src/github.com/godbus/dbus/homedir_dynamic.go:// +build
> !static_build
> Godeps/_workspace/src/github.com/godbus/dbus/homedir_static.go:// +build
> static_build
> 
> And in that code I cannot even see the logic between the differences in the two
> files, as far as I can tell when doing a static build it just looks up the
> current home dir of the user, when doing a dynamic build it does some
> complex /etc/passwd checking or the like. Absolutely nonsensical.
> 
> I'd just leave the static_build tag in there unconditionally, as it seems to
> have little to no effect anyway, and turning it off will actually result in some
> more complex and unnecessary home directory detection code being activated.

Ok, thanks for your explanation.

Actually this patch is a try to fix the libseccomp build issue... I wasn't sure
about using "static_build" only for static builds.
I don't know much the Go build system but it seems possible to link dynamically
with libseccomp.so thanks to cgo being enabled (CGO_ENABLED=1).
Can you test Thomas's proposal (pass -extldflags '$(TARGET_LDFLAGS)') ?

Feel free to respin these patches and continue the work on docker-engine ;)

Best regards,
Romain


> 
> Best,
> Christian
> 
