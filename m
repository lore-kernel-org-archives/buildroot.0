From: Christian Stewart <christian@paral.in>
Date: Fri, 05 Apr 2019 03:58:00 -0700
Subject: [Buildroot] [RFC PATCH v1 3/6] package/docker-containerd:
 upgrade to go modules
In-Reply-To: <067385b4-62bb-fcdd-95f2-9f50fb5804e2@mind.be>
References: <20190317012142.10545-1-christian@paral.in>
 <20190317012142.10545-3-christian@paral.in>
 <067385b4-62bb-fcdd-95f2-9f50fb5804e2@mind.be>
Message-ID: <877ec8d8hz.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle <arnout@mind.be> writes:
> On 17/03/2019 02:21, Christian Stewart wrote:
>>  DOCKER_CONTAINERD_LDFLAGS = \
>> -	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
>> +	-X github.com/containerd/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
>
>  This looks like a completely independent change. Or is it because we now have a
> go.mod that calls the module containerd/containerd instead of docker/containerd?

This is a fix that could be applied seperately, IIF the root import path
is github.com/containerd/containerd in the current in-tree version (I'd
have to confirm to be sure).

>> +DOCKER_CONTAINERD_BUILD_TARGETS = \
>> +	github.com/containerd/containerd/cmd/ctr \
>> +	github.com/containerd/containerd/cmd/containerd \
>> +	github.com/containerd/containerd/cmd/containerd-shim
>
>  Same question, how is this related to the go modules?

Before, we specified which targets to build using a relative path like
./cmd/dockerd. Now, we can actually specify the fully qualified path to
the "main" package, and the Go tool is smart enough to locate the
correct path inside $(@D). It's also more readable to specify it this
way, and is considered best practice.

>  Would it be possible (and useful) to add those prefixes automatically?

I don't see why. Consider this: I can give you a list of packages:

 - k8s.io/cmd/apiserver
 - k8s.io/cmd/kubectl
 - k8s.io/cmd/kubeadm
 - github.com/containerd/containerd/cmd/ctr

... and all of these can be passed to "go build," which will resolve
them and produce the outputs with the correct binary names (the last
component of the path). It's not that much extra text to leave the
"github.com/containerd/containerd" part in. It's a point of personal
preference at this point though.

Best regards,
Christian
