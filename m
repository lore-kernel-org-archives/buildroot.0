From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 31 Oct 2008 08:23:25 -0700
Subject: [Buildroot] [buildroot 0005894]: JamVM Major Bug + patch
Message-ID: <8754de00bc3903730dd6bb80a1ad4e78@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5894 
====================================================================== 
Reported By:                pviney
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5894
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-31-2008 08:23 PDT
Last Modified:              10-31-2008 08:23 PDT
====================================================================== 
Summary:                    JamVM Major Bug + patch
Description: 
JamVM crashes when background threads are used with an
InvalidMonitorStateException. Doing pretty much anything that uses
synchronization in any way crashes the jvm. The problem is not in JamVM
but in the avr32 patches.

The following program crashes:

import java.io.*;
import java.net.*;

public class TestS {
  public static void main(String args[]) {
    new Thread() {
      public void run() {
        testConnect();
      }
    }.start();
  }

  private static void testConnect() {
    try {
      System.out.println("Try connect");
      Socket s = new Socket("127.0.0.1",2000); //crashes here with an
invalid 
monitor exception: thread not owner (lock.c notifyAll)
      System.out.println("connected!");
    } catch (Exception e) {
      e.printStackTrace();
    }
    System.out.println("exiting");
    System.exit(0);
  }
}

This crash is caused by a bug in the COMPARE_AND_SWAP macro in
src/arch/avr32.h

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-31-08 08:23  pviney         New Issue                                    
10-31-08 08:23  pviney         Status                   new => assigned     
10-31-08 08:23  pviney         Assigned To               => buildroot       
10-31-08 08:23  pviney         File Added: patch                            
======================================================================
