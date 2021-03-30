From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Tue, 30 Mar 2021 09:25:30 +0800
Subject: [Buildroot] [External] Re: [PATCH v1 1/1] package/nerdctl: new
 package
In-Reply-To: <CANQCQpZtFqTrW6XzEmmsrs7ESTEsM=gtTJ7-k4AGZB2oFOFd_w@mail.gmail.com>
References: <20210323051027.91385-1-christian@paral.in>
 <CANQCQpabm-BFmSKGapR5Fiwu_60O-nvJtWuuVc=41h4d3ZZpbQ@mail.gmail.com>
 <CA+h8R2p-u8jCyhjTGH=L86AdzfbZCX7KpATPReP+2Vj_ayAFYQ@mail.gmail.com>
 <CANQCQpZtFqTrW6XzEmmsrs7ESTEsM=gtTJ7-k4AGZB2oFOFd_w@mail.gmail.com>
Message-ID: <64eb1735-ceb8-971e-c8b4-b293108a1bdd@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,
On 2021/3/29 ??10:30, Matthew Weber via buildroot wrote:
> Christian,
>
> On Fri, Mar 26, 2021 at 12:12 AM Christian Stewart <christian@paral.in> wrote:
>> Hi Matthew,
>>
>> On Tue, Mar 23, 2021 at 5:59 AM Matthew Weber <matthew.weber@collins.com> wrote:
>>> Christian,
>>>
>>> On Tue, Mar 23, 2021 at 12:11 AM Christian Stewart <christian@paral.in> wrote:
>>>> nerdctl is a CLI for containerd (package docker-containerd) which is drop-in
>>>> compatible with the Docker Daemon CLI.
>>> By chance, do you have any rough estimates on the size difference
>>> between the set of GOLang executables between a pure Docker solution
>>> and a containerd+ nerdctl? (If I remember correctly Docker was
>>> 200-300MB (engine+CLI))
>> According to "graph-size":
>>
>>   - docker-engine: 49MB
>>   - docker-cli 39MB
>>
>>   - docker-containerd: 66MB
>>
>>   - nerdctl: 19.3MB
>>
>> So, the savings would be around ~70MB.
> Nice, (sort of related) I've been gathering some rough metrics to try
> and baseline what a Buildroot container runtime for a Kubernetes edge
> device might expect for resource demands on storage/memory/processing.
> Ie. containerd+runc vs CRI-O+crun(~300k).  The footprint today using
> Docker as a runtime is just too large when you also include the
> Kubernetes (static) binaries and the resulting CNI containers after
> joining a cluster.
>
>> I believe docker-engine and docker-containerd are both much larger
>> than they have any right to be at the moment, and can probably be
>> minimized to something much smaller by deleting dependencies to
>> kubernetes repos, cloud provider libraries, and other features
>> probably most Buildroot users don't need.
> Or we add some other options which may be better suited to embedded?
>
>> One way to save space would be a "busybox" approach where there are
>> multiple symlinks to a single Go binary to implement both
>> docker-container, docker-cli, runc, etc. This way the common
>> dependencies (i.e. OCI interfaces) are shared between binaries
>> (admittedly this is what dynamic linking normally is for).
> Oh interesting, is there any precedence for this approach in other
> distros?  Go binaries are just BIG with all the debug + static
> linking....  However, they are pretty portable...
You can try balenaEngine, which comes from balenaOS, by selecting 
BR2_PACKAGE_BALENA_ENGINE.
Currently, it is a fork of Moby 19.03.

Best regards,
Tian, Yuanhao
