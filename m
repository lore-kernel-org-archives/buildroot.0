From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jun 2017 18:37:45 +0200
Subject: [Buildroot] [PATCH 2/2] docker-engine: add dependency on
 docker-proxy
In-Reply-To: <20170607225628.31423-2-christian@paral.in>
References: <20170607225628.31423-1-christian@paral.in>
 <20170607225628.31423-2-christian@paral.in>
Message-ID: <e9ba9168-f443-cdcb-e4f1-b33e99dca301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Christian,

On 08-06-17 00:56, Christian Stewart wrote:
> docker-proxy is needed by docker-engine at runtime, and was
> previously not included. This leads to the following error
> when attempting to port-map ports to a container:
> 
>   $ docker run -p 8080:8080 nginx
>   docker: Error response from daemon: driver failed programming external
>   connectivity on endpoint:
>   exec: "docker-proxy": executable file not found in $PATH.
> 
> Docker expects the docker-proxy binary to exist in the PATH.

 I wonder if forcing these dependencies is really the way to go. As I understand
it, if docker is used without portmapping, docker-proxy isn't needed, right? So
we could basically consider docker-proxy a suboption of docker-engine. And add
to its help text something like:

	  This package is required to allow portmapping in docker-daemon.

 In fact, the same consideration goes for the other runtime dependencies of
docker-engine. containerd is probably pretty much unavoidable, but are iptables
and sqlite always needed, or only for certain features?

 Regards,
 Arnout

> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> index 05670a7..8feb11b 100644
> --- a/package/docker-engine/Config.in
> +++ b/package/docker-engine/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
>  	default y
>  	depends on BR2_USE_MMU # docker-containerd
>  	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
> +	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
>  	select BR2_PACKAGE_IPTABLES # runtime dependency
>  	select BR2_PACKAGE_SQLITE # runtime dependency
>  	help
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
