From: Samuel Voss <sam.voss@gmail.com>
Date: Tue, 17 Jul 2018 12:34:46 -0500
Subject: [Buildroot] [PATCH] rust: Modify Rust to be usable as host-tool
 only
In-Reply-To: <2046565940.1039371796.1531826294693.JavaMail.root@zimbra32-e6.priv.proxad.net>
References: <20180717042953.23648-1-sam.voss@gmail.com>
 <2046565940.1039371796.1531826294693.JavaMail.root@zimbra32-e6.priv.proxad.net>
Message-ID: <CAK714x+td__f32E7ry8axEaUfUWmJT+evwT6jsKmJMS7r+vWug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

On Tue, Jul 17, 2018 at 6:18 AM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> Hi!
>
>> From: Sam Voss <sam.voss@gmail.com>
>>
>> Modify host-rust virtual package to default to host-rust-bin when no
>> other selection has been made, as long as the host supports rust. This
>> allows host only tools to still use rust when the target architecture
>> does not support it.
>>
>> Add target-specific variable which is used to differentiate host and
>> target arch requirements (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).
>>
>> A target package shall depend on this variable where a host package will
>> use the previously defined BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS. The new
>> "target" version is selectable for the same set of architectures as
>> before, but now depends on the host variant.
>>
>> Signed-off-by: Sam Voss <sam.voss@gmail.com>
>
> IIUC, the goal of this patch is to be able to build host packages which need
> rust, so host-rust-bin is set as default to avoid errors on empty variables
> and only the compiler and the host standard library are installed (not the
> target standard library). Only x86_64/x86 support is required, right?

That is correct. This boils down to being able to build a host tool on
supported platforms when the target isn't.

>
> I find it confusing that BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS and
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS are quite similar and that in
> the end BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is only used to install
> the target standard library. Is that meant to cover the case where the host
> and the target are the same (x86_64) or the librsvg-related issue?

The target was the librsvg build issues, I'm not sure it does anything
special for the target-same builds as it'll just fall into the same
scenario as the previous itteration (nothing will be gated off).

>
> Would this be solved by introducing a virtual package for the target
> standard library as previously discussed [1]?

I actually missed this conversation, and on paper I like the virtual
package but I think it is a lot more work (which is OK, but it might
be worth iterating to that point).

Thanks,

Sam
