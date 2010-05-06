From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 11:46:15 +0200
Subject: [Buildroot] Graphing package dependencies
In-Reply-To: <20100506101437.5e35c795@surf> (Thomas Petazzoni's message of
	"Thu, 6 May 2010 10:14:37 +0200")
References: <20100506101437.5e35c795@surf>
Message-ID: <87r5lp9xco.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Following the question asked by Will yesterday, I just went ahead and
 Thomas> implement a small tool that generates a graph of dependencies for a
 Thomas> given package.

 Thomas> The result of this tool for the libgtk2 package can be seen at

 Thomas>   http://free-electrons.com/~thomas/libgtk2-package-dependencies.pdf

 Thomas> This is the kind of funny things we can do with a generic package
 Thomas> infrastructure :-)

Nice!

 Thomas>  * package: optimize the implementation of UPPERCASE

 Thomas>    http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=graph-dependencies&id=b6a46aaed9e497503b66789d1b212473d7c78b58

My eyes! ;)

We could instead do something like gmsl does (http://gmsl.sf.net):

az := a b c d e f g h i j k l m n o p q r s t u v w x y z . -
AZ := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _

UPPERCASE = $(eval __tmp := $1) \
     $(foreach c, $(join $(addsuffix :,$(az)),$(AZ)), \
	$(eval __tmp :=	\
		$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),\
			$(__tmp)))) \
     $(__tmp)

It loops through a character list of the form a:A b:B .., and
substitutes the 1st charact for the second.

This is written as a generic tr function, we could ofcourse merge az and
A-Z if we only ever want to do uppercase.

-- 
Bye, Peter Korsgaard
