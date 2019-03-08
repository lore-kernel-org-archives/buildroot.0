From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 8 Mar 2019 10:02:14 +0100
Subject: [Buildroot] [PATCH v2] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <20190308093510.05b72f71@windsurf>
References: <1552032472-10717-1-git-send-email-etienne.carriere@linaro.org>
 <20190308093510.05b72f71@windsurf>
Message-ID: <CAN5uoS891q73n_aNRt-rkOGq3zN9-pANjNs06fNA2rgsfkn6NA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 8 Mar 2019 at 09:35, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri,  8 Mar 2019 09:07:52 +0100
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> > +-    arg = (struct tee_ioctl_open_session_arg *)buf;
> > ++    arg = (struct tee_ioctl_open_session_arg *)(void *)buf;
>
> This looks a bit weird. And indeed in the review of the pull request
> you made upstream, they also express some doubts about this solution,
> which just papers over the problem.
>

True. The issue is that even if alignment of the memory reference is
checked by the software instructions there are compilers that
complain.
Here buf is 8byte aligned (uint64_t) which is the alignment constraint
of struct tee_ioctl_open_session_arg (__aligned(8)). So why
complaining?
Therefore this ugly (void *) cast to get rid of the toolchain complain.

Would you rather wait the referred OP-TEE pull request [1] completes
before merging a fix in Buildroot?
There are regular build issues reported by autobuild on this. I'm fine
with them if you prefer to wait.
Otherwise, can use this change and when [1] completes, update
Buildroot accordingly if [1] comes to another resolution.

[1] https://github.com/OP-TEE/optee_client/pull/146

Regards,
etienne



> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
