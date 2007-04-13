From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 13 Apr 2007 07:10:59 -0700
Subject: [Buildroot] [buildroot 0001300]: gettext building problem.
Message-ID: <04592020b85679c24252b400f23b72e7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1300 
====================================================================== 
Reported By:                fv
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1300
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-04-2007 06:50 PDT
Last Modified:              04-13-2007 07:10 PDT
====================================================================== 
Summary:                    gettext building problem.
Description: 
Gettext build fail in -snapshot version (of today).
There is a multiple definition of 'plural_eval(...)' function.

from: 
  build_i686/gettext-0.14.6/gettext-runtime/intl/eval-plural.h:28
  build_i686/gettext-0.14.6/gettext-runtime/intl/plural-exp.h:115

from eval-plural.h: 

        /* Evaluate the plural expression and return an index value.  */
        STATIC 
        unsigned long int
        internal_function      
        plural_eval (struct expression *pexp, unsigned long int n)        
                                                                      
        {

from plural-exp.h: 

        #if !defined (_LIBC) && !defined (IN_LIBINTL)                     
                                                                      
        extern unsigned long int plural_eval (struct expression *pexp,
                              unsigned long int n);
        #endif


Seems like a condition has to be added ( eg. !defined(_BUILDROOT) )  in
plural-exp.h

My LANG environment variable is set to "fr_FR.UTF-8". 
Strangely, changing it to LANG=C and re-launching the build
seems to solve the problem


Cheers,
Francois Visconte


====================================================================== 

---------------------------------------------------------------------- 
 fv - 04-13-07 07:10  
---------------------------------------------------------------------- 
In fact doing "export LANG=C" does not solve the problem.

The attached patch solves the problem.
Put it into packages/gettext and build will work


Cheers, 
Fran?ois Visconte 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-04-07 06:50  fv             New Issue                                    
04-04-07 06:50  fv             Status                   new => assigned     
04-04-07 06:50  fv             Assigned To               => buildroot       
04-13-07 07:10  fv             Note Added: 0002311                          
======================================================================
