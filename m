From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 20 May 2020 16:59:33 -0700
Subject: [Buildroot] Sharing host tools between architectures
Message-ID: <CAGt4E5tm2iVk+1QtGhN=+gvv_D7LSQcnjePd5d+KyY_E4aSg-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

We use BR2_FORCE_HOST_BUILD=y to make the build as independent of the
distro on the build host as possible. This works well, but there is a
downside. We build for multiple platforms, and that means the same
host tools are built multiple times. That adds quite a bit of time
when all platforms are being built.

I don't think there is currently a way of "sharing" the host tools
between several target platforms. If there is, by all means, please
let me know.

Has there ever been an effort to provide this feature? If not, is this
something that would be of interest to the community?

I looked into this a little. The main problem seems to be that host
tools re-use the build mechanisms and dependency of the target build
system. That is very convenient, but it means that the host tools live
entirely underneath the target architecture, both, build and install
directory. So, if three different architectures go into their own
respective output directory, there will be three copies of the same
host tools.

I was thinking about a solution that would permit host-tools to have
their own destination. This could be specified via configuration
variable and could then be shared between builds for different target
architectures. I am guessing, roughly speaking, the build system would
need to allow for the build location and install destination to be
passed in as parameter and to default to the current values if no
alternatives are given. This would mean that target builds would be
unaffected and host builds would be unaffected for those not needing
this feature.

What are the general thoughts on this topic? I am hoping that it would
be beneficial to others, as well.

Regards,
-Markus
