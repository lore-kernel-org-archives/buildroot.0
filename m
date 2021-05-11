From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 13:19:17 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/genuinetools-img: new host
 and target package
In-Reply-To: <CA+h8R2pgbLNd7yWnnPCrTGhs0fqwj6yvhndH6p4Nwy9sSaTWbw@mail.gmail.com>
 (Christian Stewart's message of "Tue, 4 May 2021 15:03:31 -0700")
References: <20210503023305.161122-1-christian@paral.in>
 <20210503023305.161122-3-christian@paral.in>
 <CA+h8R2oJ8b48NdAOMLtKhAyV-KUp4uvHuyZ1eF8jDX_rw=WNrw@mail.gmail.com>
 <20210504203105.GR2137340@scaer>
 <CA+h8R2pgbLNd7yWnnPCrTGhs0fqwj6yvhndH6p4Nwy9sSaTWbw@mail.gmail.com>
Message-ID: <87tun9o6ve.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Yann,
 > On Tue, May 4, 2021 at 1:31 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote
 >> Im not usre I understood that, but basically one would write:
 >> 
 >> HELLO_WORLD_VERSION = 1.2.3
 >> HELLO_WORLD_SOURCE = hello-world:1.2.3
 >> HELLO_WORLD_SITE = dockerhub.com/u/hello
 >> 
 >> $(eval $(oci-image-package))
 >> 
 >> And that would download the hello-world:1.2.3 image from dockerhub and
 >> install that as a OCI image in the target filesystem, so that at runtime
 >> one could do (on the CLI, in an init script, in a systemd unit, etc...):
 >> docker run hello-world:1.2.3 /bin/hello-world
 >> 
 >> Something like that?

 > Yes, the "download" step would use host "img pull" to download the OCI
 > image, and then "img save" to store it as a .tar.gz, (which we can
 > then hash as a downloaded tar.gz file).

 > The .tar.gz can be loaded into Docker with "docker load < the-image.tar.gz"

 > The image-package helper could just download the image + save it (to
 > images dir, optionally).

So you would end up with a tar file for each container image in the
rootfs? Is that a desirable setup? Containers often share image layers,
so a single tar.gz of N containers is normally quite a bit smaller and
more efficient than N individual .tar.gz files.

What I do is basically just:
docker save -o docker.tar <container1> <container2> .. <containerN>

And then a single docker load at runtime.

-- 
Bye, Peter Korsgaard
