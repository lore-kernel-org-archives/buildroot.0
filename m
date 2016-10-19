From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 16:28:38 -0400
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add option for
	static client
In-Reply-To: <8737jsg4fn.fsf@dell.be.48ers.dk>
References: <1476850246-12883-1-git-send-email-christian@paral.in>
 <8737jsg4fn.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2ridiC-VxhRt2X13cKAebb+pr7cDkFTEkW4nE3kutE0Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Oct 19, 2016 at 3:53 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> What is the use case for docker-in-docker? Why not bind mount
> /var/run/docker.sock instead?

You need the Docker client if you want to call Docker from bash inside
a container. This is intended for use along with bind mounting the
docker.sock in the container. To guarantee you have the same client
version in the host and the docker container, it's then easier to just
bind mount both docker.sock and the docker client into the container.
You need a static client to make sure this always works. This is why I
added this option and have been using it myself for a long time.

Running Docker inside Docker is actually another thing altogether and
completely possible, and I do this to run an entire Buildroot /
SystemD based system inside Docker:
https://github.com/paralin/SkiffOS/blob/master/docker/Dockerfile

In this way I can compile an entire Skiff (buildroot) system on
Jenkins and run end-to-end tests against a Kubernetes cluster,
orchestrating the Systemd-And-Docker-In-Docker containers over a
cluster of servers.

Best,
Christian Stewart
