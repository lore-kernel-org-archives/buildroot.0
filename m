From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 21:06:14 +0200
Subject: [Buildroot] default nice level for kernel processes
In-Reply-To: <OFA47998B6.ADFB908A-ON85257CCA.0053D026-85257CCA.0053ED4B@LocalDomain>
References: <OFA47998B6.ADFB908A-ON85257CCA.0053D026-85257CCA.0053ED4B@LocalDomain>
Message-ID: <CAAXf6LVVqoJuoavLfTdiA-vzz9JGFD-yvN5zLm07nh38o-LwoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Apr 30, 2014 at 5:16 PM, Naitik Amin <Naitik.Amin@ametek.com> wrote:
> Hi there,
>
> When I start my system, by default all kernel processes start at nice level
> -20, how can give a different default nice level for the kernel processes ?

This isn't really related to buildroot, but as far as I know there is
no standard way to achieve this.
You can renice them once created, but take into account that new
kworkers may be created on the fly which would get the default
priority again.

The creation of such new kworkers is done by kthreadd. Normally, new
kworkers would get the priority of kthreadd (which you could change at
userland init), but the kernel specifically assigns a fixed priority
and scheduling class to the newly created thread.
It is possible to patch the kernel to remove this extra step, and thus
let new kworkers inherit their priority from kthreadd (which you can
control from userspace).

Best regards,
Thomas
