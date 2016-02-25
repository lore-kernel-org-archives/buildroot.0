From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 25 Feb 2016 15:01:04 +0100
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
In-Reply-To: <20160225135137.09136142@free-electrons.com>
References: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <56CCC4C4.5020402@mind.be> <20160223220413.2050528c@free-electrons.com>
 <1456396337.29027.16.camel@embedded.rocks>
 <20160225135137.09136142@free-electrons.com>
Message-ID: <1456408864.29027.48.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2016-02-25 at 13:51 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 25 Feb 2016 11:32:17 +0100, J?rg Krause wrote:
> 
> > 
> > > 
> > > Atul, are you using jsen in the context of NodeJS ? If not, in
> > > which
> > > context are you using it ?
> > Using BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL should be the only way
> > to
> > install Node.js modules. Note that npm, the Node.js package manager
> > takes care of all the package dependencies. In my opinion, this is
> > the
> > only sane way of installing Node.js modules for now.
> Thanks for raising your voice on this patch, it's definitely
> interesting to get some feedback. Since I'm not at all a NodeJS guy,
> I'm interested in having more details about:
> 
> ?- Why you think the only sane way is to use
> ???BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL as opposed to having proper
> ???packages for the different modules, like we do for the Perl,
> ???Python and Lua packages ?

Because npm supports version ranges. Have a look at the example from
the npm's docs [1]:

{ "dependencies" :
? { "foo" : "1.0.0 - 2.9999.9999"
? , "bar" : ">=1.0.2 <2.1.2"
? , "baz" : ">1.0.2 <=2.3.4"
? , "boo" : "2.0.1"
? , "qux" : "<1.0.0 || >=2.3.1 <2.4.5 || >=2.5.2 <3.0.0"
? , "asd" : "http://asdf.com/asdf.tar.gz"
? , "til" : "~1.2"
? , "elf" : "~1.2.3"
? , "two" : "2.x"
? , "thr" : "3.3.x"
? , "lat" : "latest"
? , "dyl" : "file:../dyl"
? }
}

Lets take for example the dependency "boo". A package "A" may depend on
version "2.0.1" whereas another package "B" may depend on version
"2.3.x".

In this case npm installs boo at 2.0.1 in the subdirectory "node_modules"
of package "A" and boo at 2.3.4 (assume 2.3.4 is the most recent version
for 2.3.x) in the subdirectory "node_modules" of package "B":

{prefix}/lib/node_modules?????A
???? ????node_modules
?? ? ? ? ??? boo at 2.0.1
???? B
? ? ???? node_modules
? ? ? ? ???? boo@2.3.4

As Buildroot does not support different versions for most of the
packages I think we should only use npm to install Node.js packages.

> ?- What solution you propose to properly integrate this with the
> ???download and legal infrastructure of Buildroot. Right now, having
> ???"npm install" directly download and install stuff means that the
> ???download and legal-info infrastructure of Buildroot is completely
> ???worked-around. Due to this, "make source" will not download all
> the
> ???source, "make legal-info" will not list all the licenses, caching
> in
> ???BR2_DL_DIR doesn't work, BR2_PRIMARY_SITE doesn't work, etc.

I am not sure for now howto integrate this into the Buildroot
infrastructure properly. I have never thought about this, but it will
need some work to be done, I guess.

> > 
> > About legal infrastructure: for all installed Node.js packages the
> > package.json file could be searched for the license information.
> Yes, but that's not integrated in the legal-info output, and doesn't
> solve the download infrastructure integration problem.
> 
> At best, what this package.json file could help with, is help
> creating
> a script (much like scancpan) that automatically creates a
> Buildroot
> package for a given npm module.

I have never had a look at?scancpan and I am not familiar with Perl
packages, but looking at some META.json files, I guess it could be done
similiar.

Best regards
J?rg Krause

[1]?https://docs.npmjs.com/files/package.json#dependencies
