From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Sep 2020 08:32:59 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: specify
 image to use
In-Reply-To: <20200915195050.GA2422@scaer>
References: <20200915193832.291674-1-arnout@mind.be>
 <20200915195050.GA2422@scaer>
Message-ID: <20200916063259.GD2422@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2020-09-15 21:50 +0200, Yann E. MORIN spake thusly:
> On 2020-09-15 21:38 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> > Commit 93a2870966 split off the generated gitlab-ci.yml into a child
> > pipeline. However, the generated gitlab-ci.yml file no longer had an
> > 'image' tag.
> Commit 93a2870966 still kept the image tag in the template. The removal
> of the iamge tag was done later, see below...
> > The result is that the jobs will use whatever image happens
> > to be configured on the runner - which leads to frequent pipeline
> > failures.
> Do you have an example of such a pipeline (and its parent)?

Ah, I see some, indeed:

    https://gitlab.com/buildroot.org/buildroot/-/pipelines/189823194

What is interesting here, is that the generate-gitlab-ci-yml job ran on
your runner:

    https://gitlab.com/buildroot.org/buildroot/-/jobs/737264806

    Running with gitlab-runner 12.6.0 (ac8e767a)
      on Buildroot-mind fMZePpyU

While a working pipeline was running on another runner:

    https://gitlab.com/buildroot.org/buildroot/-/pipelines/190372488
    https://gitlab.com/buildroot.org/buildroot/-/jobs/739712931

    Running with gitlab-runner 13.0.0 (c127439c)
      on gcc160 f0ab0d82

And my tests were also using a more recent runner version:

    https://gitlab.com/ymorin/buildroot/-/pipelines/186530918
    https://gitlab.com/ymorin/buildroot/-/jobs/723345502

    Running with gitlab-runner 13.3.1 (738bbe5a)
      on docker-auto-scale ed2dce3a

So it seems that the 12.6.0 runner version is too old to export the
CI_JOB_IMAGE variable, and that 13.0.0 and up are OK.

Could you update your runner, maybe?

And we should also probably be using the same version on all our
runners, maybe...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
