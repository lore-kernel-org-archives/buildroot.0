From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 10 Mar 2014 10:00:37 +0100 (CET)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <1436673405.11266711.1394440215222.JavaMail.root@openwide.fr>
Message-ID: <1612641374.11268842.1394442036999.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody

For some time I have been looking into how to integrate buildroot in a project
where buildroot would be the engine to provide the filesystem building 
infrastructure but where the main repository would not be a clone of the 
buildroot project. The idea is to try to separate cleanly what is meant to
go upstream from what is not and still be able to use git to properly save
the data that is closely linked to the project

I have now reached a point where things "simply works" and I can show my work
to the bigger buildroot community.


I will first introduce the project itself, then i'll discuss how to create
your own project based on that infrastructure and then I'll discuss what
could be upstreamed from the project and how


So, with no further delay, let's introduce Raspaudio.

Raspaudio is a small project that builds a filesystem for the raspberry pi
which allows you to easily stream audio content from the pulseaudio server
on your desktop to the audio output of the raspberry pi. Compile the 
filesystem, plug the raspberry, configure the PC, you're done.

Details on these steps can be found at 

http://openwide-ingenierie.github.io/raspaudio/

I won't go further than that in the project, the idea is that this is a
"finished" buildroot project. you clone it, you compile it, you install
it.

   $ git clone --recursive git at github.com:Openwide-Ingenierie/raspaudio.git
   $ cd raspaudio
   $ make


HOW TO REUSE THE RASPAUDIO INFRASTRUCTURE

The whole point of raspaudio is to test the buildroot infrastructure and 
provide an example that is reusable for other projects. If you want to 
make a similar project, here is how to do it

  $ mkdir new_project
  $ cd new_project
  $ git init
  $ git submodule add git://git.buildroot.net/buildroot buildroot
  $ wget https://raw.github.com/Openwide-Ingenierie/raspaudio/master/Makefile
  $ touch Config.in
  $ touch external.mk
  $ echo "output/" > .gitignore
  $ echo "dl/" >> .gitignore

Change the field PROJECT_NAME in the Makefile to the name of your project

  $ git add Makefile external.mk Config.in .gitignore
  $ git commit -m"Project infrastructure"

You can now configure your project in the usual buildroot way. For example :

  $ make raspberrypi_defconfig
  $ make menuconfig

A file named $(PROJECT_NAME)_defconfig will appear. Add this project to git
You can now work with your project in the usual way and all the important
information will be saved in git.

I tried to make the whole thing as close to the buildroot way as possible, 
all Makefile targets should work properly and most infrasturcture variables
(DL_DIR, BR2_EXTERNAL...) are set for you. This is here to help you quickly 
have the infrastructure in place to deploy your own projects based on buildroot.


WHERE TO GO FROM HERE

The main thing I have noticed is that I have been developing post-build scripts
that are completely generic and could easily be reused. It would be nice to 
upstream these scripts (in particular, the script that automatically adds the 
public key of the user doing the build to the authorized keys on the target)

I am also developing an external Config.in that allows generating 
/etc/network/interfaces via menuconfig. This would also be nice to upstream,
maybe in a "contrib" subdirectory.

Next, the Makefile of raspaudio (which is the core of the 
reusable infrastructure) could also be kept by buildroot. This would bring
all the good sides of upstreaming (up to date with buildroot, not lost
in a third party website etc...) I'd like that to happen but I can understand 
if this is not the direction the project wants to go.

Last but not least, I am not a Makefile expert. I did things the way I was 
able to, but I'm sure there are better ways to do that. So feel free to
suggest a better way to integrate stuff


    Regards

    J?r?my Rosen

fight key loggers : write some perl using vim


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr
