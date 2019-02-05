From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Feb 2019 22:47:50 -0200
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
References: <87a7jbs3uc.fsf@dell.be.48ers.dk>
Message-ID: <5c58dd3635099_290e2ab5f5537a0c12088@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Yann

On Mon, Feb 04, 2019 at 06:20 PM, Peter Korsgaard wrote:

>>>>>> "Thomas" == Thomas Petazzoni writes:
> 
>  > On Mon,  4 Feb 2019 17:55:57 +0100
>  > Peter Korsgaard wrote:
> 
>  >> Build for x86-64 as public containers in general are only available for
>  >> x86-64.  Docker needs a number of kernel options enabled, so use a custom
>  >> kernel config based on the qemu one.
> 
>  > Do you need to duplicate the kernel config entirely, or can you use
>  > board/qemu/x86_64/linux.config + a fragment ?
> 
> I didn't really look closely. I recently setup docker / docker-compose at
> $WORK, so I based the linux config on that.
> 
> I can have a look at basing it on the qemu config, but that means that
> we have to be a bit careful when bumping the qemu config, so I'm not
> sure if it makes sense.

The nice thing of using a fragment is that we would have an example of the
configs that one needs to enable in the kernel in order to use docker in the
target.
It should be *theoretically* straight-forward created from the docker
documentation. I don't know how well it is documented.
Any config that docker needs that is already in the base config (so showing in
both the base config and the fragment) should be correctly set by the merge of
configs, I guess.

But maybe we find some practical problem when trying to accomplish this
theoretical task, perhaps when changing the major version of the kernel.
Or even you think that maintaining such example config is too much out-of-scope
for the Buildroot source tree.

So... up to you guys. And it can be done in a followup patch.

[snip]
>  >> +++ b/support/testing/conf/docker-compose.yml
>  >> @@ -0,0 +1,4 @@
>  >> +version: '3'
>  >> +services:
>  >> +  busybox:
>  >> +    image: "busybox:latest"
> 
>  > Is conf/ really the right place for this ? Don't we have some other
>  > place to store the per-tests artifacts that go on the target ? I don't
>  > think we have a good organization for this at the moment, so this will
>  > do for now.
> 
> Indeed. We have a number of more-or-less random files under conf/, and
> then E.G. tests/package/test_python_*.py stores files for the target
> also under tests/package/sample_*.py

I obviously prefer the fixtures besides the test cases, since I always send test
cases in this way, AFAICR.
I just never bothered to submit a patch changing all test cases to do so.
We can choose one or another and standardize.

> 
> I can move the files under tests/package if you prefer, but I'm not sure
> if that is really cleaner.

If we decide to apply that series that Yann once submitted changing the
test cases to each package directory, I think it would make more sense to keep
the fixtures also in the same directory.

package/pkg1/Config.in
package/pkg1/pkg1.mk
package/pkg1/test_pkg1.py
package/pkg1/sample_pkg1.anything
package/pkg1/S50_init_script

Or something like this. I am not suggesting any naming convention.


Regards,
Ricardo
