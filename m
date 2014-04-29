From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Apr 2014 10:14:09 -0300
Subject: [Buildroot] [PATCH 3/6] upstream glibc 2.18/2.19 works fine
 with microblaze
In-Reply-To: <20140429071843.GI14063@waldemar-brodkorb.de>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-4-git-send-email-wbx@openadk.org>
 <53553336.2020401@zacarias.com.ar>
 <CAPALihO_K2VsaYO9erhFrKZpY9755ACOjsm56O6VvxO9MA6-0Q@mail.gmail.com>
 <535EA993.8080108@zacarias.com.ar>
 <CAPALihNu56_2XK5+oVrwON=pWS22xisVNTJc5Z6GX0vCvftScg@mail.gmail.com>
 <20140429071843.GI14063@waldemar-brodkorb.de>
Message-ID: <535FA5A1.6090102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/2014 04:18 AM, Waldemar Brodkorb wrote:

> It seems that they will be merged now. I had not the time to respin a
> new patch set because I didn't know how to do it correctly ;)
> On sunday I got a nice git workshop by a friend and now I am able to
> do it right. May be I will add a patch to the manual.
> 
> The changes do not show up yet on
> http://git.buildroot.net/buildroot. May be Peter did not pushed the
> changes yesterday.

Hi Waldemar, William.
It's in the process of being commited, i'm working with Peter on it.

> Some more Qemu microblaze stuff can be found here:
> http://blog.waldemar-brodkorb.de/index.php?archives/10-English.html&serendipity[lang_selected]=en&serendipity[user_language]=en
> 
> Unfortunately I was again wrong with my assumption that gcc 4.9.0
> solves the linking error with libgcc_eh. I accidently had my patches
> applied while testing with gcc 4.9.0. 
> 
> There seems to be a fix in https://github.com/Xilinx/gcc, but I am
> unsure how to get it extracted. The snapshot for the gcc used in
> buildroot does not contain the git history and the short tag from
> the directory (Xilinx-gcc-b93bb00) is not available as an object in
> the git repository. I would use git bisect to find the required
> patch to gcc to avoid the eglibc/glibc workaround, but I don't know
> which branch and commit is used as the basis for the gcc tarball.
> 
> Anyone know this?
> 
> So the glibc patch is still required.

I managed to track the issue down to
23c35173490ac2d6348a668dfc9c1a6eb62171f2 from xilinx-gcc git.
Basically that enables DWARF EH handling which is what's getting fixed
by including libgcc_eh.
It seems that gcc 4.9.0 with that patch ditches the new to patch glibc
(and possibly also eglibc). I'm testing that right now and will send
updated patches if that's true, in the meantime i've sent the glibc hack
patch conditional on microblaze (it's not commited yet).
The only "drawbrack" is that said patch doesn't apply cleanly to 4.8.x.
Regards.
