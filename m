From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Thu, 22 Nov 2018 19:08:33 +0300
Subject: [Buildroot] Define some package parameters dynamically
Message-ID: <e9db464a-06a4-8b66-7fa0-e87661326d2b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

In our project we have implemented an dynamic definition of some package 
parameters. I want to discuss the mechanism here before a patch 
creation. Because the work and time is needed to carefully embed it into 
the standard buildroot sources. So if mechanism is good enough I will 
create a patch.
The purpose of mechanism is to dynamically define some package 
parameters. The parameters are download method, download site, source 
name and version. In a case of VCS version is a revision and branch. 
These parameters can be defined in .config. If parameter is defined it 
overrides the corresponding parameter from <package>.mk file.

Possibly the definition of the version of stable package is not very 
actual but it very usefull for active development with version control 
systems like git. We have many packages stored in git. Every day we need 
to rebuild buildroot project with new revisions of our packages. So we 
have implemented additional parameter for package. We call it "VCS_UP". 
If package has BR2_PACKAGE_<...>_VCS_UP="y" in .config file then command 
"make <package>-vcs-up" will renew the revision of package to the newest 
(git's HEAD) one. So more stable git packages can have VCS_UP=n and the 
fixed revision will be used, but actively developed packages will have 
VCS_UP=y. There is a command "make vcs-up" to update revisions for all 
packages with VCS_UP=y.

The implement the mechanism the changes to package's Config.in is needed 
(to define additional parameters). To don't pollute standard Config.in 
files we dynamically autogenerate files Config.in.auto for all packages. 
If package need additional parameters you can write "source 
PATH_TO_AUTOGEN_FILE" to Config.in.

The mechanism is usefull for custom packages.

Thanks.
