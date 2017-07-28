From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 28 Jul 2017 00:02:34 -0300
Subject: [Buildroot] [PATCH 04/14 v4] package/skeleton: split out into
 skeleton-custom
References: <e095a88e-5e31-29d3-54de-4102990304e7@mind.be>
Message-ID: <597aa94a233d0_33a1157f84015740@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Jul 26, 2017 at 08:49 AM, Arnout Vandecappelle wrote:

> On 26-07-17 02:16, Arnout Vandecappelle wrote:
>>  I've fixed all that and was going to apply, but then I noticed that patch 1
>> breaks our tests, so I refrained from pushing it. You can fetch it from
>> https://gitlab.com/arnout/buildroot (master branch; will be rebased away in a
>> couple of days).
> 
>  So I pushed this commit with the runtime testing patch 11 on top of to gitlab
> to see what would happen, and the systemd test fails. It seems the getty on
> ttyAMA0 can't be started. Is that to be expected, due to the /var/log->/tmp symlink?
> 
>  You can inspect the output on [1], but it's not saying much.

It seems a timeout while waiting for the login prompt.

> [1]
> https://gitlab.com/arnout/buildroot/-/jobs/24489865/artifacts/raw/test-output/TestInitSystemSystemdRwFull-run.log

This test you triggered ran on the runner e11ae361.

I borrowed your commit (e8e38e9e) and did some tests.

I got lucky and the test I triggered ran on the shared runner 4e4528ca and
passed [2].
Then I retriggered it to run on my private runner, while I was also running
a resource intensive task (actually I was running the same test in the same
commit locally with the default -j 0) and the test in the runner failed [3]
(while the local test passed).

[2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25090126
[3] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25101360


TestIPythonPy3 for instance seems to be have tidy timeout for math_floor_test.
Its first execution [4] ran in the (free, as in free beer!) elastic runner from
gitlab and failed. The second execution [5] ran in my private runner (a docker
in my personal computer) and passed.

[4] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25090131
[5] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25099593


Concerning the test infra (I say that including gitlab) we should choose a path
to follow:
1) Use private runners
2) Adapt timeouts when a test sporadically fails and keep using the gitlab
runners ([6] shows that we already use them)

[6] https://gitlab.com/buildroot.org/buildroot/-/jobs/24184768

I would go with option 2. We are not doing CI for now, so sporadic failures are
not a big concern IMO.

Regards,
Ricardo
