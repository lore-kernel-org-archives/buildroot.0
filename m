From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 22:52:42 +0200
Subject: [Buildroot] [PATCH 1/3] runc: bump version to v1.0.0-rc2
In-Reply-To: <CA+h8R2q6ahe+-XJ=yGXeOC0H7imX_sSPzEXiVF9JT2UYfAA_Vg@mail.gmail.com>
 (Christian Stewart's message of "Wed, 19 Oct 2016 16:37:58 -0400")
References: <1476852805-11450-1-git-send-email-christian@paral.in>
 <877f94g4lm.fsf@dell.be.48ers.dk>
 <CA+h8R2pw90+-9eESPYc3E0oRbGKZg0R3Np90zxN9DmbJ43nbpQ@mail.gmail.com>
 <87funscc31.fsf@dell.be.48ers.dk>
 <CA+h8R2q6ahe+-XJ=yGXeOC0H7imX_sSPzEXiVF9JT2UYfAA_Vg@mail.gmail.com>
Message-ID: <877f94cb8l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Peter,
 > On Wed, Oct 19, 2016 at 4:34 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> It doesn't seem to ensure /var/lib/docker is available, so that could be
 >> added as well.

 > Meaning, making sure the directory exists?

Yes, I believe dockerd complains if it isn't available (would need to recheck).

 >> Docker afaik also has a number of runtime dependencies on E.G. iptables
 >> and iproute2, so it would be good if the docker-engine package would
 >> select those.

 > When I was originally writing the docker-engine packages I had these
 > selected, but it turns out these are not actually required to run
 > Docker. It uses its own internal syscalls.

Are you sure? I got errors without iptables. Running dockerd through
strace I see several invocations of iptables:

190   execve("/usr/bin/dockerd", ["dockerd"], [/* 11 vars */]) = 0
196   execve("/usr/bin/docker-containerd", ["docker-containerd", "-l", "unix:///var/run/docker/libcontai"..., "--shim", "docker-containerd-shim", "--metrics-interval=0", "--start-timeout", "2m", "--state-dir", "/var/run/docker/libcontainerd/co"..., "--runtime", "docker-runc"], [/* 11 vars */]) = 0
206   execve("/sbin/modprobe", ["modprobe", "aufs"], [/* 12 vars */]) = 0
207   execve("/sbin/modprobe", ["modprobe", "overlay"], [/* 12 vars */]) = 0
208   execve("/sbin/modprobe", ["modprobe", "-va", "bridge", "br_netfilter"], [/* 12 vars */]) = 0
210   execve("/sbin/modprobe", ["modprobe", "-va", "nf_nat"], [/* 12 vars */]) = 0
211   execve("/sbin/modprobe", ["modprobe", "-va", "xt_conntrack"], [/* 12 vars */]) = 0
212   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-L", "-n"], [/* 12 vars */]) = 0
213   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "--version"], [/* 12 vars */]) = 0
214   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-D", "PREROUTING", "-m", "addrtype", "--dst-type", "LOCAL", "-j", "DOCKER"], [/* 12 vars */]) = 0
217   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-D", "OUTPUT", "-m", "addrtype", "--dst-type", "LOCAL", "!", "--dst", "127.0.0.0/8", "-j", "DOCKER"], [/* 12 vars */]) = 0
220   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-D", "OUTPUT", "-m", "addrtype", "--dst-type", "LOCAL", "-j", "DOCKER"], [/* 12 vars */]) = 0
223   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-D", "PREROUTING"], [/* 12 vars */]) = 0
224   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-D", "OUTPUT"], [/* 12 vars */]) = 0
225   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-F", "DOCKER"], [/* 12 vars */]) = 0
226   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-X", "DOCKER"], [/* 12 vars */]) = 0
227   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-F", "DOCKER"], [/* 12 vars */]) = 0
228   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-X", "DOCKER"], [/* 12 vars */]) = 0
229   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-F", "DOCKER-ISOLATION"], [/* 12 vars */]) = 0
230   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-X", "DOCKER-ISOLATION"], [/* 12 vars */]) = 0
231   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-n", "-L", "DOCKER"], [/* 12 vars */]) = 0
232   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-N", "DOCKER"], [/* 12 vars */]) = 0
233   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-n", "-L", "DOCKER"], [/* 12 vars */]) = 0
234   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-N", "DOCKER"], [/* 12 vars */]) = 0
235   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-n", "-L", "DOCKER-ISOLATION"], [/* 12 vars */]) = 0
236   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-N", "DOCKER-ISOLATION"], [/* 12 vars */]) = 0
237   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-C", "DOCKER-ISOLATION", "-j", "RETURN"], [/* 12 vars */]) = 0
238   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-I", "DOCKER-ISOLATION", "-j", "RETURN"], [/* 12 vars */]) = 0
239   execve("/sbin/modprobe", ["modprobe", "-va", "xfrm_user"], [/* 12 vars */]) = 0
240   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-C", "POSTROUTING", "-s", "172.17.0.0/16", "!", "-o", "docker0", "-j", "MASQUERADE"], [/* 12 vars */]) = 0
241   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-C", "DOCKER", "-i", "docker0", "-j", "RETURN"], [/* 12 vars */]) = 0
242   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-I", "DOCKER", "-i", "docker0", "-j", "RETURN"], [/* 12 vars */]) = 0
243   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-D", "FORWARD", "-i", "docker0", "-o", "docker0", "-j", "DROP"], [/* 12 vars */]) = 0
244   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-C", "FORWARD", "-i", "docker0", "-o", "docker0", "-j", "ACCEPT"], [/* 12 vars */]) = 0
245   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-C", "FORWARD", "-i", "docker0", "!", "-o", "docker0", "-j", "ACCEPT"], [/* 12 vars */]) = 0
246   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "filter", "-C", "FORWARD", "-o", "docker0", "-m", "conntrack", "--ctstate", "RELATED,ESTABLISHED", "-j", "ACCEPT"], [/* 12 vars */]) = 0
247   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-C", "PREROUTING", "-m", "addrtype", "--dst-type", "LOCAL", "-j", "DOCKER"], [/* 12 vars */]) = 0
250   execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--wait", "-t", "nat", "-A", "PREROUTING", "-m", "addrtype", "--dst-type", "LOCAL", "-j", "DOCKER"], [/* 12 vars */]) = 0

And then I seem to be missing something else, because it dies with:


FATA[0004] Error starting daemon: Error initializing network controller:
Error creating default "bridge" network: Failed to program NAT chain:
Failed to inject docker in PREROUTING chain: iptables failed: iptables
--wait -t nat -A PREROUTING -m addrtype --dst-type LOCAL -j DOCKER:
iptables: No chain/target/match by that name.

-- 
Venlig hilsen,
Peter Korsgaard 
